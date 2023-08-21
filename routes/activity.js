var express = require('express');
var router = express.Router();
const db = require("../model/helper");




// /* GET all capitals or filtering */
// router.get("/", async (req, res) => {
//   if (!req.query.search) {
//     console.log(req.query);
//     try {
//       const results = await db("SELECT * FROM activity;");
//       res.send(results.data);
//     } catch (error) {
//       res.status(500).send(error);
//     }
//   } else {
//     const search = req.query.search;
//     console.log("SQL Query:", search);
  
//     try {
//     const query = `SELECT * FROM activity WHERE name LIKE "%${search}%" OR country LIKE "%${search}%" OR language LIKE "%${search}%" OR currency LIKE "%${search}%";`;
//       const searchParam = `%${search}%`;
//       const results = await db(query, [searchParam, searchParam, searchParam, searchParam]);
//       res.send(results.data);
//     } catch (error) {
//       res.status(500).send(error);
//     } 
//   }
// });






//  GET activities by capitalid 要不要在table里面加一个city阿// 暂时不用哈
router.get("/:capital_id", async (req, res) => {
    const id = req.params.capital_id; //goes to url above to check for ids
  
    try {
      const activityResults = await db(`SELECT * FROM activity WHERE id = ${id};`); 
      
      const activity = activityResults.data; //have more then one activity per capital, instead of just sending the first one that comes in the array with activityResults.data[0] its better to send all the array like: activityResults.data
     
  
      res.send(activity); //you want to send this as an array, so in the res.send dont need to wrap in {activity}
    } catch (error) {
      res.status(500).send(error); 
    }
  });






// POST new activities by capitalid

router.post("/:capital_id", async (req, res) => {
    const { capitalId } = req.params;
    const { title, introduction, price, description, what_to_expect, transportation, additional_Information, cancellation } = req.body;
  
   
  
    try {
      const activities = await db(`SELECT id FROM capitals WHERE id = "${capital_id}";`);// should check if the capital exist, not the activities.
      console.log(activities);
      const result = activities.data;
      console.log(result);
    
      if (result.length === 0) {
        res.status(404).send({ error: "Activity not found" });
        return;
      }
  
     
  
      await db.query(
        `INSERT INTO post (capital_id, title, introduction, price, description, what_to_expect, transportation, additional_Information, cancellation) VALUES 
        (${capital_id}, '${title}', '${introduction}', ${price}, '${description}', '${what_to_expect}', '${transportation}', '${additional_Information}', '${cancellation}');`,
      );
  
      res.status(200).send({message: "Post added!"});
      console.log("Post added");
  
    } catch (error) {
      console.log("Error posting activity", error);
      res.status(500).send({ error: "Internal server error" });
    }
  });



module.exports = router;