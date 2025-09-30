import React from 'react'
import Navbar from '../Navbar/Navbar'
import { Outlet } from 'react-router-dom'
import Footer from '../Footer/Footer'
import ScrollToTop from '../ScrollToTop/ScrollToTop'
import Chatbot from '../Chatbot/Chatbot'

const Layout = () => {
  return (
    <div>
        <ScrollToTop/>
        <Navbar/>
        <Chatbot/>
        <Outlet/>
        <Footer/>
    </div>
  )
}

export default Layout