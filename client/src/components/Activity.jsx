import { useState, useEffect} from "react";
import { Link, useParams } from "react-router-dom";
import"./Activity.css";

//这个是选择everything from id of activity 和captal_id不一样
function Activity() {
    const [activity, setActivity] = useState([]);

    let {id} = useParams();

    useEffect (() => {
        getActivity();
    })


    const getActivity = async () => {
        console.log(id)
        const response = await fetch (`/api/activity/${id}`);
        const data = await response.json();
        setActivity(data);
        console.log(data)
    }
}




export default Activity;