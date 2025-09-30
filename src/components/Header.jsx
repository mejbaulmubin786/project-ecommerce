import React from "react";
import Navbar from "./Navbar";
import SearchBar from "./SearchBar";

const Header = () => {
  return (
    <header className="sticky top-0 z-50 bg-white">
      <Navbar />
      <SearchBar />
    </header>
  );
};

export default Header;
