import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

export default function ViewProfileCustomer() {
  const navigate = useNavigate();

  const [user, setUser] = useState({});
  useEffect(() => {
    const u = JSON.parse(localStorage.getItem("loggedUser"));

    fetch("http://localhost:8080/getUserById?id=" + u.id)
      .then((resp) => resp.json())
      .then((obj) => {
        setUser(obj);

      });
  }, []);


  return (
    <div className="fs-4" >
      <div>
        <table className="table table-striped table-bordered table-info">
          <thead>
            <tr>
              <th>First name</th>
              <th>Last name</th>
              <th>Email</th>
              <th>Contact number</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{user.first_name}</td>
              <td>{user.last_name}</td>
              <td>{user.email}</td>
              <td>{user.contact_number}</td>
            </tr>
          </tbody>
        </table>
        <button
          className="btn btn-outline-primary"
          type="button"
          onClick={(e) => {
            navigate("/editprofile");
          }}
        >
          edit profile
        </button>
      </div>
    </div>
  );
}
