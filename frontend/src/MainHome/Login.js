import "./shubham.css";
import { useReducer, useState } from "react";
import { useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import { login } from "../reduxcomponents/slice";

export default function Login() {
  const initialState = {
    username: "",
    password: "",
  };

  const reducer = (state, action) => {
    switch (action.type) {
      case "update":
        return { ...state, [action.fld]: action.value };

      case "reset":
        return initialState;
      default:
    }
  };

  const [info, dispatch] = useReducer(reducer, initialState);
  const reduxaction=useDispatch();

  const [ms, setMs] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();

  const checkLogin = (e) => {
    e.preventDefault();

    var reqOptions = {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify(info),
    };

    fetch("http://localhost:8080/checkLogin", reqOptions)
      .then((resp) => {
        if (resp.ok) return resp.text();
        else throw new Error("server error");
      })
      .then((text) => (text.length ? JSON.parse(text) : {}))
      .then((obj) => {
        if (Object.keys(obj).length === 0) {
          setMsg("Invalid username/password");
        } else {

          reduxaction(login())
          localStorage.setItem("loggedUser",JSON.stringify(obj));
          if (obj.role.id === 1) {
            localStorage.setItem("CustomerUser",JSON.stringify(obj));
            navigate("/customer");
          } else if (obj.role.id === 3) {
            localStorage.setItem("VendorUser",JSON.stringify(obj));
            navigate("/vendor");
          } else if (obj.role.id === 4) {
            localStorage.setItem("LabourUser",JSON.stringify(obj));
            navigate("/serviceprovider");
          }
          else if (obj.role.id === 5) {
            
            navigate("/admin");
          }
        }
      })
      .catch((error) => setMs("server error. Try again"));
  };
  return (

        // <div className="container mt-5 login-form-container col-6" >

<div className="body">
    <div style={{ padding: '20px 50px', marginLeft:'320px', border: '1px solid ', borderRadius: '2px', height:'360px'}} >
      <form>
        <div className="credit text-center">
          <label htmlFor="username" className="form-label">Username :</label>
          <input
            type="text"
            id="username"
            name="username"
            className="form-control"
            onChange={(e) => {
              dispatch({
                type: "update",
                fld: "username",
                value: e.target.value,
              });
            }}
          />
          {/* <br /> */}
        </div>
        <div className="credit text-center">
          <label htmlFor="password" className="form-label">Password :</label>
          <input
            type="password"
            id="password"
            name="password"
            className="form-control"
            onChange={(e) => {
              dispatch({
                type: "update",
                fld: "password",
                value: e.target.value,
              });
            }}
          />
          <br />
        </div>
        <div style={{display: 'flex', justifyContent: 'center', alignItems: 'center', height: '3vh'}}>
        <button
          className="btn btn-outline-primary fs-4"
          // className="btn btn-link"
          type="submit"
          style={{width:200 } }
          
          onClick={(e) => checkLogin(e)}
        >
          Login
        </button>
        </div>
       
        <div style={{display: 'flex', justifyContent: 'center', alignItems: 'center'}}>
        <span><a href="/forgotpassword" style={{width:200}} className="btn btn-outline-primary">forgot password</a></span>
        </div>
      </form>
      <div>{msg}</div>
      <div className="credit text-center text-danger"><b>{ms}</b></div>
    </div>
    </div>
  );
}
