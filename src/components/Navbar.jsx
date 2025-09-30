import React, { useState } from "react";
import { Link, NavLink } from "react-router-dom";
import { FiMenu, FiX, FiShoppingCart, FiUser } from "react-icons/fi";

const Navbar = () => {
  const [isOpen, setIsOpen] = useState(false);

  const navLinks = [
    { name: "Home", path: "/" },
    { name: "Shop", path: "/shop" },
    { name: "About", path: "/about" },
    { name: "Contact", path: "/contact" },
    { name: "Journal", path: "/journal" },
  ];

  return (
    <div className="bg-white shadow-md">
      <div className="container mx-auto px-4 py-3 flex items-center justify-between">
        {/* Logo */}
        <Link to="/" className="text-2xl font-bold tracking-wide">
          Orebi
        </Link>

        {/* Desktop Menu */}
        <nav className="hidden md:flex space-x-6 font-medium">
          {navLinks.map((link) => (
            <NavLink
              key={link.name}
              to={link.path}
              className={({ isActive }) =>
                `hover:text-blue-600 ${
                  isActive ? "text-blue-600" : "text-gray-700"
                }`
              }
            >
              {link.name}
            </NavLink>
          ))}
        </nav>

        {/* Icons */}
        <div className="flex items-center space-x-4">
          <Link to="/cart" className="relative">
            <FiShoppingCart size={22} />
            <span className="absolute -top-2 -right-2 bg-red-500 text-white text-xs w-4 h-4 flex items-center justify-center rounded-full">
              2
            </span>
          </Link>
          <Link to="/account">
            <FiUser size={22} />
          </Link>

          {/* Mobile Menu Button */}
          <button
            onClick={() => setIsOpen(!isOpen)}
            className="md:hidden text-gray-700"
          >
            {isOpen ? <FiX size={24} /> : <FiMenu size={24} />}
          </button>
        </div>
      </div>

      {/* Mobile Menu */}
      {isOpen && (
        <div className="md:hidden bg-white shadow-md">
          <nav className="flex flex-col space-y-3 px-6 py-4 font-medium">
            {navLinks.map((link) => (
              <NavLink
                key={link.name}
                to={link.path}
                onClick={() => setIsOpen(false)}
                className={({ isActive }) =>
                  `hover:text-blue-600 ${
                    isActive ? "text-blue-600" : "text-gray-700"
                  }`
                }
              >
                {link.name}
              </NavLink>
            ))}
          </nav>
        </div>
      )}
    </div>
  );
};

export default Navbar;
