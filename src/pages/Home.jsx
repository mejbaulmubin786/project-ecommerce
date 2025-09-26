import React from 'react';

const Home = () => {
  return (
    <div className="container mx-auto px-4">
      {/* Final Offer Banner */}
      <section className="my-8 flex flex-col md:flex-row items-center">
        <div className="md:w-1/2">
          <h2 className="text-4xl font-bold">Final Offer</h2>
          <p>Up to 50% sale for all furniture items!</p>
          <button className="bg-black text-white px-4 py-2 mt-4">Shop Now</button>
        </div>
        <div className="md:w-1/2">
          {/* Placeholder for image */}
          <div className="bg-gray-200 h-64 flex items-center justify-center">Headphones Image</div>
        </div>
      </section>

      {/* Services */}
      <section className="grid grid-cols-1 md:grid-cols-3 gap-4 my-8">
        <div>Two years warranty</div>
        <div>Free shipping</div>
        <div>Return policy in 30 days</div>
      </section>

      {/* Sales Sections */}
      <section className="grid grid-cols-1 md:grid-cols-3 gap-4 my-8">
        <div>
          <div className="bg-gray-200 h-40">Phones Sale Image</div>
          <h3>Phones Sale</h3>
          <p>Up to 30% sale for all phones!</p>
          <button className="bg-black text-white px-4 py-2">Shop Now</button>
        </div>
        <div>
          <div className="bg-gray-200 h-40">Electronics Sale Image</div>
          <h3>Electronics Sale</h3>
          <p>Up to 70% sale for all electronics!</p>
          <button className="bg-black text-white px-4 py-2">Shop Now</button>
        </div>
        <div>
          <div className="bg-gray-200 h-40">Furniture Offer Image</div>
          <h3>Furniture Offer</h3>
          <p>Up to 50% sale for all furniture items!</p>
          <button className="bg-black text-white px-4 py-2">Shop Now</button>
        </div>
      </section>

      {/* New Arrivals */}
      <section className="my-8">
        <h2 className="text-3xl font-bold">New Arrivals</h2>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          {/* Repeat for 4 products */}
          <div className="bg-white p-4">
            <div className="bg-gray-200 h-40">Product Image</div>
            <p>Basic Crew Neck Tee</p>
            <p>$44.00</p>
            <span className="bg-black text-white px-2 py-1 text-xs">New</span>
          </div>
          {/* ... more products */}
        </div>
      </section>

      {/* Our Bestsellers */}
      <section className="my-8">
        <h2 className="text-3xl font-bold">Our Bestsellers</h2>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          {/* Similar to above */}
        </div>
      </section>

      {/* Phone of the Year Banner */}
      <section className="my-8 bg-gray-100 p-8 text-center">
        <h2 className="text-3xl font-bold">Phone of the year</h2>
        <p>Lorem Ipsum is simply dummy text...</p>
        <button className="bg-black text-white px-4 py-2">Shop Now</button>
      </section>

      {/* Special Offers */}
      <section className="my-8">
        <h2 className="text-3xl font-bold">Special Offers</h2>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          {/* Products with discounts */}
        </div>
      </section>
    </div>
  );
};

export default Home;