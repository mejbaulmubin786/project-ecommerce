import React from "react";
import { Link } from "react-router-dom";

const posts = [
  {
    id: 1,
    title: "Top 10 Fashion Trends of 2025",
    date: "Sep 25, 2025",
    image: "https://via.placeholder.com/400x250",
  },
  {
    id: 2,
    title: "Why Minimalist Design is the Future",
    date: "Sep 20, 2025",
    image: "https://via.placeholder.com/400x250",
  },
  {
    id: 3,
    title: "5 Must-Have Gadgets This Year",
    date: "Sep 15, 2025",
    image: "https://via.placeholder.com/400x250",
  },
];

const JournalSection = () => {
  return (
    <section className="container mx-auto px-6 py-12">
      <h2 className="text-2xl font-bold mb-6">From Our Journal</h2>
      <div className="grid md:grid-cols-3 gap-6">
        {posts.map((post) => (
          <div
            key={post.id}
            className="border rounded-lg overflow-hidden hover:shadow-md transition"
          >
            <img src={post.image} alt={post.title} className="w-full h-48 object-cover" />
            <div className="p-4">
              <p className="text-sm text-gray-500">{post.date}</p>
              <h3 className="font-semibold text-lg text-gray-800 mt-1">{post.title}</h3>
              <Link
                to="/journal"
                className="inline-block mt-3 text-blue-600 font-medium hover:underline"
              >
                Read More →
              </Link>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
};

export default JournalSection;
