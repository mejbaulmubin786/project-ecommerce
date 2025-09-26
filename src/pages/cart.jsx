import React from 'react';

const Cart = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">Cart</h1>
      <table className="w-full">
        <thead>
          <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Product name</td>
            <td>$44.00</td>
            <td><button>-</button> 1 <button>+</button></td>
            <td>$44.00</td>
          </tr>
        </tbody>
      </table>
      <div className="flex justify-end mt-4">
        <input placeholder="SIZE" />
        <button>Apply coupon</button>
        <button>Update cart</button>
      </div>
      <div className="flex justify-end mt-8">
        <table>
          <tr><td>Subtotal</td><td>389.99 $</td></tr>
          <tr><td>Total</td><td>389.99 $</td></tr>
        </table>
        <button className="bg-black text-white px-4 py-2">Proceed to Checkout</button>
      </div>
    </div>
  );
};

export default Cart;