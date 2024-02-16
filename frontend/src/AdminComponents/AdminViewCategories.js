import { useEffect, useState } from "react"
import { useNavigate } from "react-router-dom";

export default function AdminViewCategories(){
   
    const[categories,setCategories]=useState([]);
    const navigate= useNavigate();

    useEffect(()=>{
        fetch("http://localhost:8080/getCategories")
        .then(resp=>resp.json())
        .then(data=>setCategories(data))
    },[])
   
    return(
          <div className="container mt-5 login-form-container col-8">
               <h1  className="credit text-center">List of all categories</h1>
               <table  className="table table-bordered table-responsive table-striped table-info">
                   <thead>
                        <tr>
                            <th>Category name</th>
                            <th>Description</th>
                        </tr>
                   </thead>
                   <tbody>
                        {categories.map((v)=>{
                            return(
                              <tr>
                                <td>{v.name}</td>
                                <td>{v.description}</td>
                              </tr>)
                        }) }
                   </tbody>
               </table>
               <button  className="btn btn-outline-primary fs-5" style={{width:200}} type="button" onClick={()=>{navigate("/addnewcategory")}}>Add new Category</button> 
               <button  className="btn btn-outline-primary fs-5" style={{width:200}} type="button" onClick={()=>{navigate("/admin")}}>Back to homepage</button>
          </div>
    )
}