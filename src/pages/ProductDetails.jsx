import React from 'react';

const ProductDetails = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">Product</h1>
      <div className="flex flex-col md:flex-row">
        <div className="md:w-1/2 grid grid-cols-2 gap-4">
          {/* Product images */}
          <div className="bg-gray-200 h-64">Main Image</div>
          {/* Thumbnails */}
        </div>
        <div className="md:w-1/2 pl-4">
          <h2 className="text-2xl font-bold">Product Name</h2>
          <p className="text-xl">$44.00 <span className="line-through">$88.00</span></p>
          <p>Color: </p>
          {/* Color options */}
          <p>Size: </p>
          <select>
            <option>S</option>
          </select>
          <div className="flex items-center my-4">
            <button>-</button>
            <input type="number" value="1" className="w-12 text-center" />
            <button>+</button>
          </div>
          <p>STATUS: In stock</p>
          <button className="bg-black text-white px-4 py-2">Add to Cart</button>
          <button>Add to Wish List</button>
          <h3>FEATURES & DETAILS</h3>
          <p>Lorem ipsum...</p>
          <h3>SHIPPING & RETURNS</h3>
          <p>Lorem ipsum...</p>
          <h3>Description</h3>
          <p>Lorem ipsum...</p>
          <h3>Reviews (1)</h3>
          {/* Review list */}
          <h3>Add a Review</h3>
          <form>
            <input placeholder="Name" />
            <input placeholder="Email" />
            <textarea placeholder="Your review here" />
            <button>Post</button>
          </form>
        </div>
      </div>
    </div>
  );
};

export default ProductDetails;