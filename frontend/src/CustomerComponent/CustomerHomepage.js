import { useEffect, useState } from "react";
import { Link, Outlet, Route, Routes, useNavigate } from "react-router-dom";
import Products from "./Products";

import "../style.css";
import img1 from "../images/buildmart.jpg"

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faStar,
  faBars,
  faInfoCircle,
  faSearch,
  faUser,
  faShoppingCart,
  faTimes,
  faPhone,
  faEnvelope,
  faMapMarkerAlt,
  faFacebookF,
  faTwitter,
  faInstagram,
  faLinkedin,
  faPlus,
} from "@fortawesome/free-solid-svg-icons";

export default function CustomerHomepage() {
  const [categories, setCategory] = useState([]);
  const [products, setProducts] = useState([]);
  const [vendorproducts, setVendorProducts] = useState([]);
  const [msg, setMsg] = useState("");
  const [qty, setQty] = useState(0);


  const navigate = useNavigate();

  const uid = (JSON.parse(localStorage.getItem("loggedUser"))).id;
  const user = (JSON.parse(localStorage.getItem("loggedUser")));

  useEffect(() => {
    
    fetch("http://localhost:8080/getCategories")
      .then((resp) => resp.json())
      .then((data) => setCategory(data));
  }, []);

  const showProduct = (e) => {
    fetch("http://localhost:8080/getAvailableProducts?cid=" + e.target.value)
      .then((resp) => resp.json())
      .then((data) => setProducts(data));

      setCatflag(true);

     
  };

  const viewProduct = (v) => {
    // alert(productid);
    fetch("http://localhost:8080/getVendorProductsCustomer?pid=" + v.target.value)
      .then((resp) => resp.json())
      .then((data) => setVendorProducts(data));

      setPrdflag(true);
  
  };


  const addToCart1 = (vpid, uid, qty) => {
    fetch(
     
      "http://localhost:8080/addToCart?vpid=" +
        vpid +
        "&uid=" +
        uid +
        "&qty=" +
        qty
    )
      .then((resp) => resp.json())
      .then((data) => {
        if (data !== null) {
          setMsg("successfully added to cart");
        } else {
          setMsg("something went wrong");
        }
      });
      // alert(qty);
  };

  const[catflag,setCatflag]=useState(false);
  const[prdflag,setPrdflag]=useState(false);

  return (
    <div className="App fs-4">
      <header className="header container-fluid">
        <ul className="nav navbar">
          <li className="nav-link logo">
            <Link to="/customer" className="nav-link" style={{ fontSize: 40 }}>
            <img  src={img1} style={{width:"250px", height:"50px"  }} alt="pic"/>
            </Link>
          </li>
          <li className="nav-link">
            <Link to="/customer" className="nav-link">
              HOME
            </Link>
          </li>
          
          <li className="nav-link">
            <Link to="/myOrders" className="nav-link">
              Order History
            </Link>
          </li>

          
        
          
          <li className="nav-item">
            <Link to="/viewCart" className="nav-link">
              <div className="icon-container">
                <FontAwesomeIcon icon={faShoppingCart} />
              </div>
            </Link>
          </li>
          <li className="nav-item">
            <Link to="/viewProfile" className="nav-link">
              <div className="icon-container">
                <FontAwesomeIcon icon={faUser} />
              </div>
            </Link>
          </li>
          <li className="nav-link">
            <Link to="/logout" className="nav-link">
              Logout
            </Link>
          </li>
        </ul>
      </header>

      <div  id="operations">
      
     
        <h5 className="text-info text-center">Welcome <span >{user.customer.first_name} {user.customer.last_name}</span></h5>
       
      </div>
      <div id="cart">
       
      </div>
      <nav className="navbar navbar-expand-sm navbar-light bg-light mb-3">
        <div className="container col-3">
          <ul className="navbar-nav">
            <li>
              <select name="categories" onChange={(e) => showProduct(e)}>
                <option disabled selected>select Catagories</option>
                {categories.map((v) => {
                  return <option value={v.id}>{v.name}</option>;
                 
                })}
              </select>
            </li>
          </ul>
        </div>
         <div className="container col-3 "> 
          
              <select name="categories" onChange={(e) => viewProduct(e)} >
                <option disabled selected>select Product</option>
                {products.map((v) => {
                  return <option value={v.id}>{v.productName}</option>;
                 
                })}
              </select>
        </div> 
        
      </nav>

       

     
   <div  style={{display:prdflag?"block":"none"}}>
      <table  className="table table-striped table-responsive table-info">
        <thead>
          <tr>
            <th>
              <h2>Image</h2>
            </th>
            <th>
              <h2>Product name</h2>
            </th>
            <th>
              <h2>Description</h2>
            </th>
            <th>
              <h2>Vendor name</h2>
            </th>
            <th>
              <h2>Price</h2>
            </th>
            
            <th>
              <h2>Cart ops</h2>
            </th>
          </tr>
        </thead>
        <tbody>
          {vendorproducts.map((v) => {
            return (
              <tr>
                <td>
                  <img
                    src={`data:image/png;base64,${v.product.picture}`}
                    alt="Product"
                    className="img-thumbnail"
                    style={{ maxWidth: "300px", height: "300px" }}
                  />
                </td>
                <td>
                  <h3>{v.product.productName}</h3>
                </td>
                <td>
                  <h3>{v.product.description}</h3>
                </td>
                <td>
                  <h3>{v.vendor.shopName}</h3>
                </td>
                <td>
                  <h3> {v.price}</h3>
                </td>
                <td>
                  <div className="input-group">
                   
                    <div className="input-group-append">
                      <button
                        className="btn btn-outline-warning"
                        type="button"
                        onClick={() => addToCart1(v.id, uid, qty)}
                      >
                        Add to Cart
                      </button>
                    </div>
                  </div>
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
      <div>
        <label htmlFor="qty">Enter quantity</label>
        <input
                      type="number"
                      className="form-control"
                      id="qty"
                      name="qty"
                      value={qty}
                      onChange={(e) => setQty(e.target.value)}
                    />
      </div>
      </div>
      
      <div className="text-success">{msg}</div>
      <Outlet />
    </div>
  );
}
