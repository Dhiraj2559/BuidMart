import "./script.js";

import "./style.css";

import img from "./images/buildmart.jpg";
import Home from "./MainHome/Home.js";

import { Route, Routes } from "react-router";
import { Link } from "react-router-dom";

// Importing ForntAwsome for icon and symbols
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faStar,
  faBars,
  faInfoCircle,
  faSearch,
  faUser,
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

import {
  faFacebookF as fabFacebookF,
  faTwitter as fabTwitter,
  faInstagram as fabInstagram,
  faLinkedin as fabLinkedin,
} from "@fortawesome/free-brands-svg-icons";
import { library } from "@fortawesome/fontawesome-svg-core";
import { useState } from "react";
import Login from "./MainHome/Login.js";
import LoginSuccess from "./MainHome/LoginSuccess.js";
import { useSelector } from "react-redux";
import CustomerHomepage from "./CustomerComponent/CustomerHomepage.js";
import VendorHome from "./VendorComponent/VendorHome.js";

import {useNavigate } from "react-router-dom";
import RegistrationForm from "./CustomerComponent/regstration.js";
import ShopRegistrationForm from "./Registration/ShopkeeperRegister.js";
import ServiceRegistrationForm from "./Registration/ServiceRegister.js";
import AdminHome from "./AdminComponents/AdminHome.js";
import AddCategorySuccess from "./AdminComponents/AddCategorySuccess.js";
import AdminViewCategories from "./AdminComponents/AdminViewCategories.js";
import AdminViewCustomer from "./AdminComponents/AdminViewCustomer.js";
import AdminViewVendor from "./AdminComponents/AdminViewVendor.js";
import AdminViewAllVendors from "./AdminComponents/AdminViewAllVendors.js";
import AdminViewAllCustomers from "./AdminComponents/AdminViewAllCustomers.js";
import AdminAddCategory from "./AdminComponents/AdminAddCategory.js";
import Logout from "./MainHome/Logout.js";
import VendorOrderItems from "./VendorComponent/VendorOrderItems.js";
import OrderHistory from "./VendorComponent/OrderHistory.js";
import EditProduct from "./VendorComponent/EditProduct.js";
import ViewProfile from "./CustomerComponent/ViewProfile.js";
import EditProfileCustomer from "./CustomerComponent/EditProfileCustomer.js";
import AdminAddProduct from "./AdminComponents/AdminAddProduct.js";
library.add(faStar);

function App() {
  const [role, setRole] = useState("");
  const mystate = useSelector((state) => state.logged);
  const navigate=useNavigate();

  // alert(mystate.loggedIn);
  return (
    <div className="App">
      <header style={{backgroundColor:"InfoBackground"}} className="header container-fluid">
        <div style={{ display: mystate.loggedIn ? "none" : "block" }}>
          <ul className="nav navbar">
         <li className="nav-link logo">
              <Link to="/home" className="nav-link" style={{ fontSize: 40 }}>
              <img  src={img} style={{width:"300px", height:"100px"  }} alt="pic"/>
              </Link>
            </li>
            <li className="nav-link">
              <Link to="/home" className="nav-link fs-4">
                HOME
              </Link>
            </li>

            <li className="nav-link">
              <Link to="/login" className="nav-link fs-4">
                Login
              </Link>
            </li>
            <li>
            <select name="role" className="nav-link fs-4" onChange={(e)=>{navigate(e.target.value)}}>
                <option><p className="fs-4">New Here? Register</p></option>
                <option value="/userRegister"><a href="/userRegister" >
                                              Customer Registration</a>
                </option>
                <option value="/vendorregister"><a href="/vendorregister" className="nav-link">
                                          Vendor Registration</a>
                </option>
                <option value="/labourregister"><a href="/labourregister" className="nav-link">
                                            Service Provider Registration</a>
                </option>
              </select>
            </li>
          </ul>
        </div>
      </header>
      <body>
        <Routes>
          <Route path="/" element={<Home />}></Route>
          <Route path="/home" element={<Home />}></Route>
          <Route path="/login" element={<Login />}></Route>
          <Route path="/logout" element={<Logout />}></Route>
          <Route path="/userRegister" element={<RegistrationForm />}></Route>
          <Route path="/vendorregister" element={<ShopRegistrationForm />}></Route>
          <Route path="/labourregister" element={<ServiceRegistrationForm />}></Route>
          <Route path="/customer" element={<CustomerHomepage />}></Route>
          <Route path="/vendor" element={<VendorHome />}></Route>
          <Route path="/admin" element={<AdminHome />}></Route>


          <Route path="/v_categories" element={<AdminViewCategories />}></Route>
          <Route path="/add_category" element={<AdminAddCategory />}></Route>
          <Route path="/v_vendors" element={<AdminViewAllVendors />}></Route>
          <Route path="/v_customers" element={<AdminViewAllCustomers />}></Route>
          <Route path="/viewCustomer/:id/" element={<AdminViewCustomer />}></Route>
          <Route path="/categoryaddsuccess" element={<AddCategorySuccess />}></Route>
          <Route path="/viewVendor/:id/" element={<AdminViewVendor />}></Route>
          <Route path="/addnewcategory" element={<AdminAddCategory />}></Route>
          <Route path="/add_product" element={<AdminAddProduct />}></Route>
          

          <Route path="/viewProfile" element={<ViewProfile />} />
          <Route path="/editprofile" element={<EditProfileCustomer />} />
          <Route path="/orders" element={<OrderHistory />}></Route>
          <Route path="/vieworderitems" element={<VendorOrderItems />}></Route>
          <Route path="/editproduct" element={<EditProduct />}>{" "}</Route>


        </Routes>
      </body>
      <footer>
       

        <section className="footer">
          

          <div className="credit text-center">
            {" "}
            Created by{" "}
            <span className="text-danger">
              | DHIRAJ NAGARGOJE | GAJANAN SHINDE | RUSHIKESH NIKAM | SUYASH BHONDE |
            </span>{" "}
            all rights reserved!{" "}
          </div>
        </section>
      </footer>
    </div>
  );
}

export default App;
