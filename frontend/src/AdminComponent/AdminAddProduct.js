import { useEffect, useReducer, useState } from "react";
import { useNavigate } from "react-router-dom";

export default function AdminAddProduct(){

    const initialState={
        product_name : "",
        description : "",
        stock_quantity:"",
        category_id:"",
        picture:""
    }

    const reducer=(state,action)=>{
        switch(action.type)
        {
            case 'update' :
                 return { ...state, [action.fld]:action.value};

             case 'reset' : return initialState;
        }
  }

  const navigate= useNavigate();
  const[info,dispatch]=useReducer(reducer,initialState);
  const [categories, setCategories] = useState([]);
  const [products, setproducts] = useState([]);

  const editProduct = (e) => {
    dispatch({ type: "update", fid: "category_id", value: e.target.value });

    fetch("http://localhost:8080/getProductsByCid?cid=" + e.target.value)
      .then((resp) => resp.json())
      .then((data) => setproducts(data));
  };
  useEffect(() => {
    fetch("http://localhost:8080/getCategories")
      .then((resp) => resp.json())
      .then((data) => setCategories(data));
  }, []);


  const addProduct=()=>{
       
      const reqOptions={
        method : "POST",
        headers : {'content-type':'application/json'},
        body : JSON.stringify(info)
      }

      fetch("http://localhost:8080/addProduct",reqOptions)
      .then(resp=>{
        if(resp.ok)
        {
            navigate("/categoryaddsuccess");
        }
        else
             throw new Error("Server error");
      }
        )
        .catch((error)=>{
            alert("updation failed");
        })
  }
    return(
        <div className="container mt-5 login-form-container col-6 credit text-center" style={{ backgroundColor: 'lightblue', padding: '20px', border: '1px solid ', borderRadius: '10px' }}>
            <h1>Products details form</h1>
            <form>
                <label htmlFor="product_name">Enter Product Name</label>
                <input type="text" id="product_name" name=" product_name" value={info.product_name} onChange={(e)=>{dispatch({type:'update', fld:'product_name', value:e.target.value})}} />
                <label htmlFor="description">Enter description</label>
                <input type="text" id="description" name="description" value={info.description} onChange={(e)=>{dispatch({type:'update', fld:'description', value:e.target.value})}} />
                <label htmlFor="stock_quantity">Enter stock_quantity</label>
                <input type="number" id="stock_quantity" name="stock_quantity" value={info.stock_quantity} onChange={(e)=>{dispatch({type:'update', fld:'stock_quantity', value:e.target.value})}} />
              {/*  <label htmlFor="cid">Enter cid</label>
                <input type="number" id="cid" name="cid" value={info.cid} onChange={(e)=>{dispatch({type:'update', fld:'cid', value:e.target.value})}} />
    */} 
                <div>
              <label htmlFor="category_id" className="form-label">
                Select Category
              </label>
              <select
                id="category_id"
                name="category_id"
                className="form-control"
                onChange={(e) => {
                  editProduct(e);
                }}
              >
                <option className=' credit text-center'>Select Category</option>
                {categories.map((v) => {
                  return (
                    <option key={v.id} value={v.id} className=' credit text-center'>
                      {v.name}
                    </option>
                  );
                })}
              </select>
            </div>
                <label htmlFor="picture">Enter picture</label>
                <div className=' credit text-center'><input  type="file" name="file" id="file"/></div>
               <div>
                <button className="btn btn-outline-primary fs-4 " style={{width:200}} type="button" onClick={()=>{addProduct()}} >Add Product</button></div>
                <div>
                <button className="btn btn-outline-primary fs-4 " style={{width:200}} type="button" onClick={()=>{navigate("/admin")}} >Back</button></div>
            </form>
        </div>
    )
}