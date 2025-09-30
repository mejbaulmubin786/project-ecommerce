import React from 'react'
import Navbar from '../Navbar/Navbar'
import Hero from '../Hero/Hero'
import Category from '../Category/Category'
import OurValues from '../OurValues/OurValues'
import Products from '../Products/Products'
import Discount from '../Discount/Discount'
import Process from '../Process/Process'
import Testimonial from '../Testimonials/Testimonial'
const Home = () => {
  return (
    <div>
        <Hero/>
        <Category/>
        <OurValues/>
        <Products/>
        <Discount/>
        <Process/>
        <Testimonial/>
    </div>
  )
}

export default Home