import React from 'react';

const Login = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">Login</h1>
      <p>Lorem ipsum...</p>
      <h2>Returning Customer</h2>
      <form className="max-w-md">
        <input placeholder="Email address" className="block w-full mb-4" />
        <input type="password" placeholder="Password" className="block w-full mb-4" />
        <button className="bg-black text-white px-4 py-2">Log in</button>
      </form>
      <h2>New Customer</h2>
      <p>Lorem ipsum...</p>
      <button className="bg-black text-white px-4 py-2">Continue</button>
    </div>
  );
};

export default Login;