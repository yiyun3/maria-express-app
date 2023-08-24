import { useState, useEffect} from "react";
import { Link, useParams } from "react-router-dom";
import "./Activities.css"

//我的困惑fetch或者async都是一样的效果吗

function Activities() {
    const [activities, setActivities] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    //hook
    let {id} = useParams();
    

    useEffect (() => {
        getActivities(); // Trigger fetching when component mounts or searchTerm changes
        }, [id]);


   


    // fetch filtered data based on capitalid
    // const getActivities = async () => {
    //     const response = await fetch (`/api/activity`);
    //     const data = await response.json();
    //     setActivities(data);
    //     console.log(data)//to check my fetch is working or not
    // };
    // console.log(activities);//same as above


  
    //fetch filtered data based on capitalid
    const getActivities = async () => {
        console.log(id)
        const response = await fetch (`/api/activity/${id}`);
        const data = await response.json();
        setActivities(data);
        console.log(data)
    };
    
    



    





   


    return (
        <div id= "Activities">  
        {/* style={{marginTop: "100px", marginBottom:"100px"}} 需要在div里直接改margin的时候参考这个*/}

           {/* {activities.map(e => e.price)} 单个的map */}
            {/* <p> {e.price}$ per person </p> */}
             {/* {activities.map( e => ( ) */}

        
            <div className="acts">
                <h2 className="euro-acts">Activities in {activities.length > 0 ? activities[0].city : ""} </h2>
      
                    {/* grid */}
                    <div className="card-grid2">
                    {activities.map((e) => (
                        <div key={e.id} className="card2">
                            <img src={e.url1} alt="Image" className="card-img2" />
                            <h3 className="card-title2">{e.title}</h3>
                            {/* <h3 className="act-description">{capital.country}</h3> */}
                            <button className="card-btn2">
                                <Link to={`/activity/${e.id}`}>Discover</Link>
                            </button>
                        </div>
                    ))}
                    </div>
                    {/* grid */}                                     
            </div>


            
           
         
              
        </div>
            
            )
    
}









export default Activities;