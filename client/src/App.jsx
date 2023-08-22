import "./App.css"
import Capitals from "./components/Capitals"
import AddPost from "./components/AddPost"
import Home from "./components/Home"
import { Routes, Route, Link } from "react-router-dom"
import Capital from "./components/Capital"
import Activities from "./components/Activities"



function App() {

  


  return (
    <div>
      <nav className="navbar">
        <div>
          <Link to="/">Home</Link> 
          {/* link to other page */}
        </div>
        
        <div>
          <Link to="/capitals">Capitals</Link>
        </div>

        <div>
          <Link to="/addpost">Add Post</Link>
        </div>




      </nav>
      <Routes>  
        {/* use this file as parent file/routes */}
        <Route path="/" element={<Home/>} />
        {/* child file 导入什么嘞具体是，和home文件有什么区别只是区分文章和nav吗*/}
        <Route path="/capitals" element={<Capitals/>} />
        <Route path="/capitals/:id" element={<Capital/>} />
        <Route path="/addpost" element={<AddPost/>} />
        <Route path="/activities/:id" element={<Activities/>} />
        {/* <Route path="/actid/:id" element={<Activity/>} /> */}
        
      </Routes>
      <footer>
        <p>Eurocapi, 2023.</p>
      </footer>
    </div>
  )
}

export default App
