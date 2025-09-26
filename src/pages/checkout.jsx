import React from 'react';

const Checkout = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">Checkout</h1>
      <p>Have a coupon? Click here to enter your code</p>
      <h2>Billing Details</h2>
      <form className="max-w-md grid grid-cols-2 gap-4">
        <input placeholder="First Name *" />
        <input placeholder="Last Name *" />
        {/* More fields */}
      </form>
      <h2>Additional Information</h2>
      <textarea placeholder="Other Notes (optional)" />
      <h2>Your Order</h2>
      <table>
        <tr><td>Product name x 1</td><td>389.99 $</td></tr>
        <tr><td>Subtotal</td><td>389.99 $</td></tr>
        <tr><td>Total</td><td>389.99 $</td></tr>
      </table>
      <div>
        <label><input type="radio" /> Bank</label>
        <p>Pay via Bank; you can pay with your credit card if you don’t have a Bank account.</p>
        <label><input type="radio" /> Bank 2</label>
      </div>
      <p>Your personal data will be used to process your order...</p>
      <button className="bg-black text-white px-4 py-2">Proceed to Bank</button>
    </div>
  );
};

export default Checkout;