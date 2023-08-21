import { useState} from "react";
import "./AddActivity.css";


function AddActivity() {
    const [newActivity, setNewActivity] = useState ({
        capital_id: "",
        title: "",
        introduction: "",
        price: 0,
        description: "",
        what_to_expect: "",
        transportation: "",
        additional_Information: "",
        cancellation: "",
    });

    const handleInputChange = (event) => {
        const { name, value } = event.target;
        setNewActivity((prevActivity) => ({
          ...prevActivity,
          [name]: value,
        }));
      };
    
    const handleSubmit = async (event) => {
        event.preventDefault();
        
        try {
            const response = await fetch("/api/post", {
                method: "post",
                headers: {
                    "Content-type": "application/json",
                },
                body: JSON.stringify(newActivity),
            });
        
                 if (response.ok) {
                  console.log("Activity added successfully");
                  }else {
                  console.log("Failed to add activity");
                   }     
            }catch(error) {
            console.log("Error adding activity:", error);
              }
    };
};






export default AddActivity;