import React from 'react'
import {
  createRoutesFromElements,
  createBrowserRouter,
  Route,
  RouterProvider,
} from "react-router-dom";
//import Header from './components/Header';
//import Footer from './components/Footer';
import Home from './pages/Home';
import Products from './pages/Products';
import ProductDetails from './pages/ProductDetails';
import About from './pages/About';
import Contacts from './pages/Contacts';
import Login from './pages/Login';
import Signup from './pages/Signup';
import MyAccount from './pages/MyAccount';
import Cart from './pages/Cart';
import Checkout from './pages/Checkout';
import NotFound from './pages/NotFound';

const router = createBrowserRouter(
  createRoutesFromElements(
    <>
      <Route path="/" element={<Home />} > </Route>
      <Route path="/products" element={<Products />} > </Route >
      <Route path="/product" element={<ProductDetails />} ></Route >
      <Route path="/about" element={<About />} ></Route >
      <Route path="/contacts" element={<Contacts />} ></Route >
      <Route path="/login" element={<Login />} ></Route >
      <Route path="/signup" element={<Signup />} ></Route >
      <Route path="/my-account" element={<MyAccount />} ></Route >
      <Route path="/cart" element={<Cart />} ></Route >
      <Route path="/checkout" element={<Checkout />} ></Route >
      <Route path="*" element={<NotFound />} ></Route > 
     
    </>
  )
);


const App = () => {
  return (

    <RouterProvider router={router} />

  )
}

export default App