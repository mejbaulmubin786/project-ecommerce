import React from 'react';
import { Link } from 'react-router-dom';

const NotFound = () => {
  return (
    <div className="container mx-auto px-4 text-center my-16">
      <h1 className="text-8xl font-bold">404</h1>
      <p>The page you were looking for couldn't be found. The page could be removed or you misspelled the word while searching for it. Maybe try a search?</p>
      <input placeholder="Type to search" className="bg-gray-100 px-4 py-2 rounded-full w-64 my-4" />
      <Link to="/" className="bg-black text-white px-4 py-2 block w-max mx-auto">Back to Home</Link>
    </div>
  );
};

export default NotFound;