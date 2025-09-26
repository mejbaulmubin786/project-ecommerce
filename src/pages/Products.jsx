import React from 'react';

const Products = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">Products</h1>
      <div className="flex">
        <aside className="w-1/4 pr-4">
          {/* Shop by Category */}
          <h3>Shop by Category</h3>
          <ul>
            <li>Category 1</li>
            {/* ... */}
          </ul>
          {/* Shop by Color */}
          <h3>Shop by Color</h3>
          {/* Color swatches */}
          {/* Shop by Brand */}
          {/* Shop by Price */}
        </aside>
        <main className="w-3/4">
          <div className="flex justify-between mb-4">
            <p>Products from 1 to 12 of 80</p>
            <select>Sort by: Featured</select>
            <select>Show: 36</select>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            {/* Product cards */}
            <div className="bg-white p-4">
              <div className="bg-gray-200 h-40">Image</div>
              <p>Basic Crew Neck Tee</p>
              <p>$44.00</p>
              <div className="flex space-x-2">
                <button>Add to Cart</button>
                <button>Compare</button>
                <button>Add to Wish List</button>
              </div>
            </div>
            {/* Repeat for more */}
          </div>
          <div className="flex justify-center mt-4">
            <button>1</button>
            <button>2</button>
            {/* Pagination */}
          </div>
        </main>
      </div>
    </div>
  );
};

export default Products;