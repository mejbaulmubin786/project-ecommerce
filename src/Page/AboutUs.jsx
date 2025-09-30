import React, { useRef } from 'react'
import OurMission from '../components/OurMission/OurMission'
import aboutus from '../assets/about.webp'
import gsap from 'gsap'
import { useGSAP } from '@gsap/react'

const AboutUs = () => {
    const containerRef=useRef()
    useGSAP(()=>{
        const tl=gsap.timeline()
        tl.from(".text-1",{
            opacity:0,
            y:-100,
            duration:0.8,
            delay:0.3,
            ease:'bounce.out'
        })
        tl.from(".text-2",{
            opacity:0,
            x:-300,
            duration:0.7,
            stagger:0.3,
            ease:'back.in',
        },"-=0.2")
        tl.from(".container-img",{
            opacity:0,
            x:500,
            duration:0.7,
            ease:'power4.in',
        },"<")
        tl.from(".text-3",{
            opacity:0,
            scale:15,
            duration:0.5,
            stagger:0.3,
            ease:'circ.out',
        })
    },{scope:containerRef})
    
  return (
    <section className='max-w-[1300px] md:mt-15 mt-5 md:py-10 py-5 md:px-12 px-6 mx-auto overflow-x-hidden'>
        {/* parent container of two sub parent div  */}
        <div ref={containerRef} className='grid md:grid-cols-2 grid-cols-1 -space-y-5'>
        {/* parent div of left side text content  */}
        <div className='md:mr-4 md:pt-25 pt-20'>
            <div>
                <h1 className='text-1 md:text-6xl text-4xl font-bold text-orange-600'>
                    About <span className='text-zinc-800'>Us</span>
                </h1>
                <p className='text-2 text-zinc-600 lg:text-xl mt-5 md:pb-10 pb-5 max-w-[500px]'>We're passionate about bringing you the finest products with exceptional service. Our journey started with a simple vision: to make quality accessible to everyone.</p>
            </div>
            <div className='flex gap-x-8 md:gap-x-6 lg:gap-x-8 text-center'>
                <div className='text-3'>
                <h3 className='lg:text-3xl text-2xl  text-orange-500 font-bold'>50K+</h3>
                <p className='text-zinc-600 lg:text-lg text-xs md:text-sm'>Happy Customers</p>
                </div>
                <div className='text-3'>
                <h3 className='lg:text-3xl text-2xl text-orange-500  font-bold'>10+</h3>
                <p className='text-zinc-600 lg:text-lg text-xs md:text-sm'>Years Experience</p>
                </div>
                <div className='text-3'>
                <h3 className='lg:text-3xl text-2xl text-orange-500  font-bold'>25+</h3>
                <p className='text-zinc-600 lg:text-lg text-xs md:text-sm'>Countries</p>
                </div>
            </div>
            <div className='text-2 flex items-center md:mt-7 mt-5'>
            <button className=' text-white md:text-lg text-xs cursor-pointer active:to-green-700 bg-gradient-to-b from-green-500 to-green-600 py-2 px-5 rounded-lg border-none font-bold'>Start Shopping
            </button>
            </div>
        </div>
        {/* parent div of right side image content  */}
        <div className='relative container-img gpu-boost'>
            <img 
            src={aboutus}
            className='md:h-full h-[400px] w-full object-contain  '/>
            <div className='absolute  lg:bottom-29 md:bottom-5 md:-z-10 lg:z-10 bottom-20 -left-15 
            md:left-[35%] lg:-left-[10%]   bg-orange-600 text-center md:p-5
            p-3 md:px-4 pl-10  md:pt-20 lg:pt-5 rounded-xl'><h3 className='text-white font-bold md:text-2xl text-lg'>200%</h3>
            <p className='text-white md:text-md text-xs'>Growth Rate</p></div>

        </div>
        
        </div>
        <OurMission/>
    </section>
  )
}

export default AboutUs