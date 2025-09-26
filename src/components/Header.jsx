import React from 'react';
import { Link } from 'react-router-dom';
import { Bars3Icon, MagnifyingGlassIcon, UserIcon, ShoppingBagIcon } from '@heroicons/react/24/outline';

const Header = () => {
  return (
    <header className="bg-white shadow-sm">
      <div className="container mx-auto px-4 py-4 flex items-center justify-between">
        <Link to="/" className="text-2xl font-bold">OREBI</Link>
        <nav className="hidden md:flex space-x-6">
          <Link to="/" className="text-gray-600 hover:text-black">Home</Link>
          <Link to="/products" className="text-gray-600 hover:text-black">Shop</Link>
          <Link to="/about" className="text-gray-600 hover:text-black">About</Link>
          <Link to="/contacts" className="text-gray-600 hover:text-black">Contacts</Link>
          <Link to="/journal" className="text-gray-600 hover:text-black">Journal</Link> {/* Assuming Journal is a placeholder */}
        </nav>
        <div className="flex items-center space-x-4">
          <div className="relative">
            <input type="text" placeholder="Search Products" className="bg-gray-100 px-4 py-2 rounded-full w-64" />
            <MagnifyingGlassIcon className="h-5 w-5 absolute right-3 top-3 text-gray-500" />
          </div>
          <UserIcon className="h-6 w-6 text-gray-600" />
          <ShoppingBagIcon className="h-6 w-6 text-gray-600" />
          <Bars3Icon className="h-6 w-6 text-gray-600 md:hidden" /> {/* Mobile menu */}
        </div>
      </div>
    </header>
  );
};

export default Header;