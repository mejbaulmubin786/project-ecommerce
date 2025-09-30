import React from "react";
import { Link } from "react-router-dom";

const Hero = () => {
  return (
    <section className="bg-gray-100">
      <div className="container mx-auto px-6 py-16 grid md:grid-cols-2 items-center gap-10">
        {/* Left Content */}
        <div>
          <p className="uppercase tracking-widest text-sm text-gray-500">Special Offers</p>
          <h1 className="text-4xl md:text-5xl font-bold leading-tight mt-2">
            Basic Crew Neck Tee <br /> <span className="text-blue-600">Up to 30% Off</span>
          </h1>
          <p className="mt-4 text-gray-600">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae odio
            vel felis facilisis laoreet.
          </p>
          <Link
            to="/shop"
            className="inline-block mt-6 bg-blue-600 text-white px-6 py-3 rounded-md hover:bg-blue-700 transition"
          >
            Shop Now
          </Link>
        </div>

        {/* Right Image */}
        <div>
          <img
            src="https://via.placeholder.com/600x500"
            alt="Hero Banner"
            className="rounded-lg shadow-lg"
          />
        </div>
      </div>
    </section>
  );
};

export default Hero;
