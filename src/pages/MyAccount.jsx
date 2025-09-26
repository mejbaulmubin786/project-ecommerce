import React from 'react';

const MyAccount = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">My Account</h1>
      <p>Hello admin (not admin? Log out)</p>
      <p>From your account dashboard you can view your recent orders, manage your shipping and billing addresses, and edit your password and account details.</p>
      <ul className="space-y-4">
        <li>Dashboard</li>
        <li>Others</li>
        <li>Downloads</li>
        <li>Addresses</li>
        <li>Account details</li>
        <li>Logout</li>
      </ul>
    </div>
  );
};

export default MyAccount;