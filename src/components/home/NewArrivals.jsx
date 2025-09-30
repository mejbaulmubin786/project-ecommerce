import React from "react";
import { FiShoppingCart } from "react-icons/fi";

const newArrivals = [
  { id: 1, name: "Denim Jacket", price: 70, image: "https://via.placeholder.com/300x300" },
  { id: 2, name: "Leather Backpack", price: 95, image: "https://via.placeholder.com/300x300" },
  { id: 3, name: "Wireless Earbuds", price: 150, image: "https://via.placeholder.com/300x300" },
  { id: 4, name: "Casual Shirt", price: 40, image: "https://via.placeholder.com/300x300" },
];

const NewArrivals = () => {
  return (
    <section className="container mx-auto px-6 py-12">
      <h2 className="text-2xl font-bold mb-6">New Arrivals</h2>
      <div className="grid sm:grid-cols-2 md:grid-cols-4 gap-6">
        {newArrivals.map((product) => (
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

export default NewArrivals;
