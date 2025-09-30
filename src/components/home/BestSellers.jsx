import React from "react";
import { FiShoppingCart } from "react-icons/fi";

const bestSellers = [
  { id: 1, name: "Basic Crew Neck Tee", price: 44, image: "https://via.placeholder.com/300x300" },
  { id: 2, name: "Classic Hoodie", price: 59, image: "https://via.placeholder.com/300x300" },
  { id: 3, name: "Stylish Sneakers", price: 89, image: "https://via.placeholder.com/300x300" },
  { id: 4, name: "Smart Watch", price: 120, image: "https://via.placeholder.com/300x300" },
];

const BestSellers = () => {
  return (
    <section className="container mx-auto px-6 py-12">
      <h2 className="text-2xl font-bold mb-6">Our Bestsellers</h2>
      <div className="grid sm:grid-cols-2 md:grid-cols-4 gap-6">
        {bestSellers.map((product) => (
          <div
            key={product.id}
            className="border rounded-lg overflow-hidden hover:shadow-lg transition"
          >
            <img src={product.image} alt={product.name} className="w-full h-56 object-cover" />
            <div className="p-4">
              <h3 className="font-medium text-gray-800">{product.name}</h3>
              <p className="text-blue-600 font-bold mt-1">${product.price}</p>
              <button className="mt-3 flex items-center gap-2 bg-blue-600 text-white px-4 py-2 rounded-md w-full justify-center hover:bg-blue-700 transition">
                <FiShoppingCart /> Add to Cart
              </button>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
};

export default BestSellers;
