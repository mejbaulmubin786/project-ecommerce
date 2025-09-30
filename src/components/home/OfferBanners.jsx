import React from "react";
import { Link } from "react-router-dom";

const offers = [
  { id: 1, title: "Furniture Offer", discount: "50%", color: "bg-yellow-100" },
  { id: 2, title: "Electronics Sale", discount: "70%", color: "bg-green-100" },
  { id: 3, title: "Phones Sale", discount: "30%", color: "bg-red-100" },
];

const OfferBanners = () => {
  return (
    <section className="container mx-auto px-6 py-12 grid md:grid-cols-3 gap-6">
      {offers.map((offer) => (
        <div key={offer.id} className={`${offer.color} p-8 rounded-lg shadow-md text-center`}>
          <h3 className="text-xl font-bold">{offer.title}</h3>
          <p className="text-gray-600 mt-2">Up to sale for all items! {offer.discount}</p>
          <Link
            to="/shop"
            className="mt-4 inline-block bg-blue-600 text-white px-5 py-2 rounded-md hover:bg-blue-700 transition"
          >
            Shop Now
          </Link>
        </div>
      ))}
    </section>
  );
};

export default OfferBanners;
