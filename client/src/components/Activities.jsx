import { useState, useEffect} from "react";
import { Link } from "react-router-dom";
import "./Activities.css"

//我的困惑fetch或者async都是一样的效果吗

function Activities() {
    const [activities, setActivities] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");

//fetch filtered data based on capitalid
    const getActivities = async () => {
        const response = await fetch (`/api/activities?search=${searchTerm}`);
        const data = await response.json();
        setActivities(data);
    };

    useEffect (() => {
        getActivities(); // Trigger fetching when component mounts or searchTerm changes

    }, [searchTerm]);

    return (
        <div id= "Activities">
            
            


        </div>
    )



  


    
}









export default Activities;