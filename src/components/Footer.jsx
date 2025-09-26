import React from 'react';
import { Link } from 'react-router-dom';

const Footer = () => {
  return (
    <footer className="bg-gray-100 py-8">
      <div className="container mx-auto px-4 grid grid-cols-1 md:grid-cols-5 gap-8">
        <div>
          <h4 className="font-bold mb-4">MENU</h4>
          <ul className="space-y-2">
            <li><Link to="/">Home</Link></li>
            <li><Link to="/products">Shop</Link></li>
            <li><Link to="/about">About</Link></li>
            <li><Link to="/contacts">Contact</Link></li>
            <li><Link to="/journal">Journal</Link></li>
          </ul>
        </div>
        <div>
          <h4 className="font-bold mb-4">SHOP</h4>
          <ul className="space-y-2">
            <li>Category 1</li>
            <li>Category 2</li>
            <li>Category 3</li>
            <li>Category 4</li>
            <li>Category 5</li>
          </ul>
        </div>
        <div>
          <h4 className="font-bold mb-4">HELP</h4>
          <ul className="space-y-2">
            <li>Privacy Policy</li>
            <li>Terms & Conditions</li>
            <li>Special E-shop</li>
            <li>Shipping</li>
            <li>Secure Payments</li>
          </ul>
        </div>
        <div>
          <h4 className="font-bold mb-4">(052) 611-5711</h4>
          <p>company@domain.com</p>
          <p>575 Crescent Ave. Quakertown, PA 18951</p>
        </div>
        <div className="text-right">
          <h2 className="text-3xl font-bold">OREBI</h2>
        </div>
      </div>
      <div className="container mx-auto px-4 mt-8 flex justify-between text-gray-500">
        <div className="space-x-4">
          <span>f</span>
          <span>in</span>
          <span>@</span>
        </div>
        <p>2020 Orebi Minimal eCommerce Figma Template by Adveits</p>
      </div>
    </footer>
  );
};

export default Footer;