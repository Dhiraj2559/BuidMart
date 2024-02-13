import React, { useState, useReducer } from 'react';
import { useNavigate } from 'react-router-dom';

const init = {
  first_name: '',
  last_name: '',
  username: '',
  email: '',
  contact_number: '',
  password: '',
  role: '1', 
};


const reducer = (state, action) => {
  switch (action.type) {
    case 'update':
      return { ...state, [action.fld]: action.val };
    case 'reset':
      return init;
    default:
      return state;
  }
};

const RegistrationForm = () => {
  const [msg,setmsg]=useState("");
  const [formData, dispatch] = useReducer(reducer, init);
  const [validationErrors, setValidationErrors] = useState({});
  const navigate = useNavigate();

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    dispatch({ type: 'update', fld: name, val: value });

    const emailRegex = /^[\w._#-]{4,20}@[\w]{5,15}\.[a-z]{3}$/;
    const usernameRegex = /^[a-zA-Z0-9_]+$/;
    const contact_numberregex=/^\d{10}$/;
    const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;

    const newValidationErrors = { ...validationErrors };

    if (name === 'email' && !emailRegex.test(value)) {
      newValidationErrors.email = 'Invalid email format';
    } else if (name === 'username' && !usernameRegex.test(value)) {
      newValidationErrors.username = 'Only letters, numbers, and underscores are allowed';
    } else if (name === 'userId' && value.trim() === '') {
      newValidationErrors.userId = 'User ID is required';
    } else if(name ==='contact_number' && !contact_numberregex.test(value)){
      newValidationErrors.contact_number = 'Length should be 10 digits';
    }else if (name === 'password' && !passwordRegex.test(value)) {
      newValidationErrors.password =
        'Password must contain at least one letter, one number, and one special character';
    } else {
      delete newValidationErrors[name];
    }

    setValidationErrors(newValidationErrors);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (Object.values(validationErrors).some((error) => error !== '')) {
      alert('Please fix the validation errors before submitting.');
      return;
    }

    setValidationErrors({});

    try {
      const response = await fetch('http://localhost:8080/userRegister', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      if (response.ok) {
        const data = await response.json();
        console.log('Registration successful:', data);
        navigate("/login");

        dispatch({ type: 'reset' });
      } else {
        console.error('Registration failed'); 
        setmsg("Registration failed");      
      }
    } catch (error) {
      console.error('Error during registration:', error);
    }
  };

  return (
    <div className="container mt-5 login-form-container col-6" style={{ backgroundColor: 'lightblue', padding: '20px', border: '1px solid ', borderRadius: '10px' }}>
     <div className="credit text-center">
     <h2 color='Blue'><b>USER REGISTRATION FORM</b></h2>
     </div>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <label htmlFor="email" className="form-label">
            Email
          </label>
          <input
            type="email"
            className="form-control"
            id="email"
            name="email"
            value={formData.email}
            onChange={handleInputChange}
            required
          />
          <div className="text-danger">{validationErrors.email}</div>
        </div>
        <div className="mb-3">
          <label htmlFor="username" className="form-label">
            Username
          </label>
          <input
            type="text"
            className="form-control"
            id="username"
            name="username"
            value={formData.username}
            onChange={handleInputChange}
            required
          />
          <div className="text-danger">{validationErrors.username}</div>
        </div>
        <div className="mb-3">
          <label htmlFor="contact_number" className="form-label">
            Phone
          </label>
          <input
            type="number"
            className="form-control"
            id="contact_number"
            name="contact_number"
            value={formData.contact_number}
            onChange={handleInputChange}
            required
          />
          <div className="text-danger">{validationErrors.contact_number}</div>
        </div>
        <div className="mb-3">
          <label htmlFor="password" className="form-label">
            Password
          </label>
          <input
            type="password"
            className="form-control"
            id="password"
            name="password"
            minLength={8}
            value={formData.password}
            onChange={handleInputChange}
            required
          />
          <div className="text-danger">{validationErrors.password}</div>
        </div>
        

        <div className="mb-3">
          <label htmlFor="first_name" className="form-label">
            First Name
          </label>
          <input
            type="text"
            className="form-control"
            id="first_name"
            name="first_name"
            value={formData.first_name}
            onChange={handleInputChange}
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="last_Name" className="form-label">
            Last Name
          </label>
          <input
            type="text"
            className="form-control"
            id="last_name"
            name="last_name"
            value={formData.last_name}
            onChange={handleInputChange}
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="address" className="form-label">
            Address
          </label>
          <textarea
            className="form-control"
            id="address"
            name="address"
            value={formData.address}
            onChange={handleInputChange}
            required
          />
        </div>

        <button type="submit" className="btn btn-primary">
          Register
        </button>
      </form>
      <div className="credit text-center text-danger"><b>{msg}</b></div>
    </div>
  );
};

export default RegistrationForm;
