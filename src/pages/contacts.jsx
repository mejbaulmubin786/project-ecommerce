import React from 'react';

const Contacts = () => {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-4xl font-bold my-8">Contacts</h1>
      <h2>Fill up a Form</h2>
      <form className="max-w-md">
        <input placeholder="Your name here" className="block w-full mb-4" />
        <input placeholder="Your email here" className="block w-full mb-4" />
        <textarea placeholder="Your message here" className="block w-full mb-4" />
        <button className="bg-black text-white px-4 py-2">Post</button>
      </form>
      {/* Map placeholder */}
      <div className="my-8 bg-gray-200 h-64">Map with offices: Lithuania, Slovakia, Germany</div>
    </div>
  );
};

export default Contacts;