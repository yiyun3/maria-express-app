import { useState, useEffect, useHistory} from "react";
import { Link, useParams } from "react-router-dom";
import"./Activity.css";

//这个是选择everything from id of activity 和captal_id不一样
function Activity() {
    const [activity, setActivity] = useState([]);


    const MyComponent = () => {
        const history = useHistory();
      
    const goBack = () => {
          history.goBack(); // 使用 goBack 方法返回上一页
    }};

    let {id} = useParams();

    useEffect (() => {
        getActivity();
    })




    const getActivity = async () => {
        console.log(id)
        const response = await fetch (`/api/activity/actid/${id}`);
        const data = await response.json();
        setActivity(data);
        console.log(data)
    }

    return(
        <div style={{marginTop: "100px", marginBottom:"100px"}} id="Activity">
            <div className="imgAll">
                
            <img className="gridImage1" src={activity.url1} alt="img2" />
            <div className="sideImg">
            <img className="gridImage" src={activity.url2} alt="img2"  />
            <img className="gridImage" src={activity.url3} alt="img3" />
            <img className="gridImage" src={activity.url4} alt="img4" />
            <img className="gridImage" src={activity.url5} alt="img2"  />
            <img className="gridImage" src={activity.url6} alt="img3" />
            <img className="gridImage" src={activity.url7} alt="img4" />
            <img className="gridImage" src={activity.url8} alt="img4" />
            </div>
                
            </div>
          <div className="actAct">
            <div className="main-act">
                <div className="white-text1">
                        <h1 className="act-title">{activity.title}</h1>          
                </div>
            </div>


            
            <div className="bodyAct1">
                <h3>About</h3>
                <p>{activity.introduction}</p>
                <br />
                <br />
                <br />
                
                <p>from EUR <span class="price">{activity.price}</span>  per person</p>    
            </div>

            <br />
            <br />
            <br />
            
            
            <div className="list1">
                <ul>
                <li>{activity.description1}</li>
                <li>{activity.description2}</li>
                <li>{activity.description3}</li>
                <li>{activity.description4}</li>
                <li>{activity.description5}</li>  
                </ul>      
            </div>

            <div className="bodyActs">
            <div className="bodyAct2">
                <h3>What to expect</h3>
                <p>{activity.what_to_expect}</p>
            </div>

            <div className="bodyAct3">
                <h3>Transportation</h3>
                <p>{activity.transportation}</p>
            </div>

            <div className="bodyAct4">
                <h3>Additional information</h3>
                <p>{activity.additional_Information}</p>
            </div>

            <div className="bodyAct5">
                <h3>Cancellation policy</h3>
                <p>{activity.cancellation}</p>
            </div>

            </div>
         </div> 



            <button className="go-back">
                    <Link to={`/activities/${id}`}>Go back</Link>
            </button>

        </div>

        )

}





export default Activity;