import React from 'react';

const Signup = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">Sign up</h1>
      <p>Lorem ipsum...</p>
      <h2>Your Personal Details</h2>
      <form className="max-w-md grid grid-cols-2 gap-4">
        <input placeholder="First Name" />
        <input placeholder="Last Name" />
        <input placeholder="Email address" />
        <input placeholder="Telephone" />
        {/* More fields for address, password */}
        <div className="col-span-2">
          <label><input type="checkbox" /> I have read and agree to the Privacy Policy</label>
        </div>
        <div className="col-span-2">
          <label>Subscribe Newsletter <input type="radio" name="newsletter" /> Yes <input type="radio" name="newsletter" /> No</label>
        </div>
        <button className="bg-black text-white px-4 py-2 col-span-2">Log in</button> {/* Should be Sign up */}
      </form>
    </div>
  );
};

export default Signup;