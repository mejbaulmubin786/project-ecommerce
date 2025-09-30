import React, { useRef } from 'react'
import Button from '../Button/Button'
import freshfruits from "../../assets/fresh-fruits.webp"
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/all'
import { useGSAP } from '@gsap/react'


gsap.registerPlugin(ScrollTrigger)

const Discount = () => {
  const containerRef=useRef()
  useGSAP(()=>{
    gsap.from(containerRef.current,{
      
      x:1200,

      duration:0.3,
      ease:'back.in',
      scrollTrigger:{
        trigger:containerRef.current,
        start:'top 120%',
        end:'bottom 90%',
        scrub:1,
        // markers:true
      }
    })
  })
  
  
  
  return (
    <div className='overflow-x-hidden'>
    <section ref={containerRef} className='bg-zinc-100 bg-contain bg-no-repeat bg-right 'style={{backgroundImage:`url(${freshfruits})`}}>
    <div className='md:bg-transparent bg-zinc-100 overflow-x-hidden flex lg:flex-row flex-col max-w-[1400px] px-10 py-10 md:py-0 lg:py-10 mx-auto'>
            <span className='text-orange-500 md:text-9xl text-6xl font-bold h-fit lg:self-center transform lg:-rotate-90'>20%</span>
            <div className='max-w-[600px] md:max-w-[400px] lg:max-w-[600px] md:mb-5 lg:mb-0'>
                <h3 className='text-4xl md:text-6xl  lg:text-7xl text-zinc-800 font-bold'>
                First Order Discount!
                </h3>
        <p className='text-zinc-600 my-6'>Enjoy an exclusive first order discount on our grocery website! Shop fresh essentials and save big on your first purchase. Fast Delivery and Quality guranteed.</p>
        <Button content="Get a Discount"/>
        </div>
    </div>
    </section>
    </div>
  )
}

export default Discount