import React from "react";
import { Link } from "react-router-dom";
import { FiFacebook, FiTwitter, FiInstagram } from "react-icons/fi";

const Footer = () => {
  return (
    <footer className="bg-gray-900 text-gray-300 mt-10">
      <div className="container mx-auto px-6 py-10 grid grid-cols-1 md:grid-cols-4 gap-8">
        
        {/* Brand Info */}
        <div>
          <h2 className="text-xl font-bold text-white mb-4">Orebi</h2>
          <p className="text-sm">
            575 Crescent Ave. Quakertown, PA 18951
          </p>
          <p className="text-sm mt-2">company@domain.com</p>
          <p className="text-sm mt-1">(052) 611-5711</p>
        </div>

        {/* Shop Links */}
        <div>
          <h3 className="font-semibold text-white mb-3">Shop</h3>
          <ul className="space-y-2 text-sm">
            <li><Link to="/shop">Category 1</Link></li>
            <li><Link to="/shop">Category 2</Link></li>
            <li><Link to="/shop">Category 3</Link></li>
            <li><Link to="/shop">Category 4</Link></li>
            <li><Link to="/shop">Category 5</Link></li>
          </ul>
        </div>

        {/* Help Links */}
        <div>
          <h3 className="font-semibold text-white mb-3">Help</h3>
          <ul className="space-y-2 text-sm">
            <li><Link to="/privacy">Privacy Policy</Link></li>
            <li><Link to="/terms">Terms & Conditions</Link></li>
            <li><Link to="/shipping">Shipping</Link></li>
            <li><Link to="/secure-payments">Secure Payments</Link></li>
          </ul>
        </div>

        {/* Newsletter + Social */}
        <div>
          <h3 className="font-semibold text-white mb-3">Newsletter</h3>
          <div className="flex space-x-2">
            <input
              type="email"
              placeholder="Your email"
              className="px-3 py-2 rounded-md text-gray-900 w-full"
            />
            <button className="bg-blue-600 px-4 py-2 rounded-md text-white">
              Subscribe
            </button>
          </div>
          <div className="flex space-x-4 mt-4 text-xl">
            <a href="#"><FiFacebook /></a>
            <a href="#"><FiTwitter /></a>
            <a href="#"><FiInstagram /></a>
          </div>
        </div>
      </div>

      <div className="text-center text-gray-500 text-sm py-4 border-t border-gray-700">
        © 2025 Orebi. All Rights Reserved.
      </div>
    </footer>
  );
};

export default Footer;
