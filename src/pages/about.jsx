import React from 'react';

const About = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">About</h1>
      <p>Orebi is one of the world’s leading ecommerce brands...</p>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4 my-8">
        <div>
          <div className="bg-gray-200 h-64">Image</div>
          <button className="bg-black text-white px-4 py-2">Our Brands</button>
        </div>
        <div>
          <div className="bg-gray-200 h-64">Image</div>
          <button className="bg-black text-white px-4 py-2">Our Stores</button>
        </div>
      </div>
      <h2>Our Vision</h2>
      <p>Lorem ipsum...</p>
      <h2>Our Story</h2>
      <p>Lorem ipsum...</p>
      <h2>Our Brands</h2>
      <p>Lorem ipsum...</p>
    </div>
  );
};

export default About;