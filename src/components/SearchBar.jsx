import React from "react";
import { FiSearch } from "react-icons/fi";

const SearchBar = () => {
  return (
    <div className="bg-gray-100 border-t border-b">
      <div className="container mx-auto px-4 py-3 flex flex-col md:flex-row items-center gap-3 md:gap-6">
        
        {/* Category Dropdown (Demo only, later dynamic) */}
        <select className="border px-3 py-2 rounded-md text-sm text-gray-700 w-full md:w-48">
          <option>All Categories</option>
          <option>Electronics</option>
          <option>Fashion</option>
          <option>Home</option>
          <option>Accessories</option>
        </select>

        {/* Search Input */}
        <div className="flex flex-grow w-full border rounded-md overflow-hidden">
          <input
            type="text"
            placeholder="Search products..."
            className="flex-grow px-3 py-2 text-gray-700 outline-none"
          />
          <button className="bg-blue-600 text-white px-4 flex items-center justify-center">
            <FiSearch size={20} />
          </button>
        </div>
      </div>
    </div>
  );
};

export default SearchBar;
