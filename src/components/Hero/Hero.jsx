import React, { useRef } from 'react'
import { gsap } from 'gsap'
import {useGSAP} from "@gsap/react"
import Grocery from "../../assets/grocery.webp"
import Button from '../Button/Button'
const Hero = () => {
  const container=useRef();
  useGSAP(()=>{
    const tl=gsap.timeline();
    tl.from(".para",{
      opacity:0,
      x:-500,
      scale:0.2,
      duration:1,
      ease:'back.in'
    })
    tl.from("#title",{
      scale:0.2,
      opacity:0,
      ease:'bounce.out',
      duration:0.5,
      delay:0.5
      
    })
    
    tl.from("#box",{
      x:500,
      scale:0.2,
      duration:1,
      rotate:45,
      ease:"power1.out"
    })

  },{scope:container})


  return (
    <section>
        <div ref={container} className='flex  max-w-[1400px] min-h-screen md:min-h-[60vh] mx-auto md:flex-row flex-col gap-y-5 px-10 items-center lg:pt-36  md:pt-40 pt-32 md:pb-15 overflow-hidden'>
        <div className='para flex-1'>
            <span className='bg-orange-100 text-orange-500 text-lg rounded-full px-5 py-2 inline-block' id='title'>Export Best Quality...</span>
            <h1 className=' lg:text-7xl/20 text-4xl/14 mt-4 font-bold '>Tasty Organic <br/><span className='text-orange-500'>Fruits</span> & <span className='text-orange-500'>Veggies</span><br/> In Your City</h1>
            <p className=' text-zinc-600 md:text-lg text-md max-w-[530px] mt-5 mb-10'>From farm to table, we deliver fresh, nutrient-rich products you can trust</p>
            <Button  content="Shop Now"/>
        </div>
        <div id='box' className='gpu-boost flex-1'><img src={Grocery}  className='h-full w-full object-contain' alt="Hero.image"/></div>
        </div>
    </section>
  )
}

export default Hero