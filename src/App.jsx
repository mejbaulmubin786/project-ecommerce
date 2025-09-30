import { useState, useEffect } from "react"
import Home from "./components/Home/Home"
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import Fruits from "./components/Fruits/Fruits"
import Dairy from "./components/Dairy/Dairy"
import SeaFood from "./components/SeaFood/SeaFood"
import AllProducts from "./components/AllProducts/AllProducts"
import Layout from "./components/Layout/Layout"
import AboutUs from "../src/Page/AboutUs"
import Processpage from "./Page/Processpage"
import ContactUs from "./components/ContactUs/ContactUs"
import ScrollToTop from "./components/ScrollToTop/ScrollToTop"

const App = () => {
  const router = createBrowserRouter([
    {
      path: '/',
      element:<Layout/>,
      children: [
        {
          path: '/',
          element: <Home />,
        },
        {
          path: '/home',
          element: <Home />,
        },
        {
          path: '/fruits',
          element: <Fruits />,
        },
        {
          path: '/dairy',
          element: <Dairy />,
        },
        {
          path: '/seafood',
          element: <SeaFood />,
        },
        {
          path: '/allproducts',
          element: <AllProducts />,
        },
        {
          path: '/aboutus',
          element: <AboutUs/>,
        },
        {
          path: '/processpage',
          element: <Processpage />,
        },
        {
          path: '/contactus',
          element: <ContactUs />,
        },
      ]
    },

  ])

  return <RouterProvider router={router} />
}

export default App