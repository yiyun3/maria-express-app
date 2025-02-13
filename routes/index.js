var express = require('express');
var router = express.Router();
const db = require("../model/helper");



// /* GET all capitals */
// router.get("/", async (req, res) => {
//   console.log(req.query);
//   try {
//     const results = await db("SELECT * FROM capital ORDER BY id ASC;");
//     res.send(results.data);
//   } catch (error) {
//     res.status(500).send(error);
//   }
// });
// /* GET filtering */
// router.get("/", async (req, res) => {
//   const search = req.query.search;
//   console.log("SQL Query:", search);

//   try {
//   const query = `SELECT * FROM capital WHERE name LIKE "%${search}%" OR country LIKE "%${search}%" OR language LIKE "%${search}%";`;
//     const searchParam = `%${search}%`;
//     const results = await db(query, [searchParam, searchParam, searchParam]);
//     res.send(results.data);
//   } catch (error) {
//     res.status(500).send(error);
//   }
// });



//each router is a different tunnel provides different content


//talking to the backend, selecting data from the table and sending to frontend

/* GET all capitals or filtering */
router.get("/", async (req, res) => {
  if (!req.query.search) {
    console.log(req.query);
    try {
      const results = await db("SELECT * FROM capital ORDER BY id ASC;");
      res.send(results.data);
    } catch (error) {
      res.status(500).send(error);
    }
  } else {
    const search = req.query.search;
    console.log("SQL Query:", search);
  
    try {
    const query = `SELECT * FROM capital WHERE name LIKE "%${search}%" OR country LIKE "%${search}%" OR language LIKE "%${search}%" OR currency LIKE "%${search}%";`;
      const searchParam = `%${search}%`;
      const results = await db(query, [searchParam, searchParam, searchParam, searchParam]);
      res.send(results.data);
    } catch (error) {
      res.status(500).send(error);
    } 
  }
});

/* GET capital by id */
router.get("/:capital_id", async (req, res) => {
  const id = req.params.capital_id; //goes to url in line 65 to check for ids

  try {
    const capitalResults = await db(`SELECT * FROM capital WHERE id = ${id};`); //put the table where you ask for data here, send to db
    const commentsResults = await db(`SELECT * FROM post JOIN user ON post.user_id = user.id WHERE post.capital_id = ${id};`);

    const capital = capitalResults.data[0];//saves the data from line 69 70
    const comments = commentsResults.data;

    res.send({ capital, comments }); //send the data back
  } catch (error) {
    res.status(500).send(error); //if failes will be 500 err
  }
});


/* UPDATE population by id */
router.put("/:capital_id", async (req, res) => {
  const id = req.params.capital_id;
  const { population } = req.body;
  console.log("REQ.BODY", req.body);

  try {
    await db(`UPDATE capital SET population = ${population} WHERE id = ${id};`);
    const results = await db("SELECT * FROM capital;");
    res.send(results.data);
  } catch (error) {
    console.log("something not working", error);
    res.status(500).send(error);
  }
});

/* POST comment in capital */
router.post("/:capital_id", async (req, res) => {
  const { capital_id } = req.params;
  const { title, description, local, username } = req.body;

  const currentDate = new Date();
  // the padStart method pads a string with another one until the goal length is met
  // JS returns the day and month in zero-based indexing, so JAN is represented as 0 and therefore we need to add 1
  const day = String(currentDate.getDate() + 1).padStart(2, "0");
  const month = String(currentDate.getMonth() + 1).padStart(2, "0");
  const year = currentDate.getFullYear();
  const date = `${year}-${month}-${day}`;

  try {
    const user = await db(`SELECT id FROM user WHERE username = "${username}";`);
    console.log(user);
    const result = user.data;
    console.log(result);
  
    if (result.length === 0) {
      res.status(404).send({ error: "User not found" });
      return;
    }

    const user_id = result[0].id;

    await db(
      `INSERT INTO post (capital_id, title, description, local, date, user_id) VALUES (${capital_id}, "${title}", "${description}", ${local}, "${date}", ${user_id});`,
    );

    res.status(200).send({message: "Post added!"});
    console.log("Post added");

  } catch (error) {
    console.log("Comment not posted", error);
    res.status(500).send({ error: "Internal server error" });
  }
});

/* DELETE comment in capital */


module.exports = router;
