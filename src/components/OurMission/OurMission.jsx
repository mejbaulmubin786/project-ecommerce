import React, { useRef } from 'react'
import { GoGoal } from "react-icons/go";
import Heading from '../Heading/Heading'
import { FaCheckCircle, FaLightbulb, FaUserCheck } from 'react-icons/fa';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/all';
import { useGSAP } from '@gsap/react';

gsap.registerPlugin(ScrollTrigger)
const OurMission = () => {
  const containerRef=useRef()
  useGSAP(()=>{
    const texts=gsap.utils.toArray(".container-text")
    texts.forEach((text,i)=>{
      gsap.from(text,{
        opacity:0,
        y:100,
        scale:0.3,
        duration:0.5,
        ease:'power3.out',
        scrollTrigger:{
          trigger:text,
          scrub:2,
          start:"top 100%",
          end:"bottom 90%",
          // markers:true
        }
      })
    })
    const cards=gsap.utils.toArray(".container-card")
    cards.forEach((card,i)=>{
      gsap.from(card,{
        opacity:0,
        y:100,
        scale:0.3,
        duration:0.5,
        ease:'power3.out',
        scrollTrigger:{
          trigger:card,
          scrub:2,
          start:"top 110%",
          end:"bottom 90%",
          // markers:true
        }
      })
    })
  },{scope:containerRef})

  return (
    <section ref={containerRef} className='max-w-[1300px] md:mt-2 -mt-10 py-2 md:px-12  px-6 mx-auto'>
        <div className='container-text text-5xl text-green-500 flex justify-center md:mb-7 mb-5  mt-8'><GoGoal/></div>
        <Heading highlight='Our' heading='Mission'/>
        <div className='container-text pb-10 flex-wrap  mt-5 mx-auto max-w-[600px] text-center'><h3 className='md:text-lg text-zinc-600'>To create meaningful connections between exceptional products and the people who value quality, innovation, and authentic experiences.   </h3>
        </div>
        {/* goal cards  */}
        <div className='grid md:grid-cols-3 grid-cols-1 gap-x-6 gap-y-10'>
            {
                goal.map((val,index)=>{
                    return(
                        <div key={index} className='container-card group max-w-[350px] bg-white p-7 rounded-lg border-1 border-zinc-300 hover:shadow-xl'>
                            <h3 className='mb-5 group-hover:scale-1.2'><div>{val.icon}</div></h3>
                            <h3 className='text-xl font-semibold pb-3'>{val.title}</h3>
                            <p className='text-zinc-600'>{val.description}</p>
                        </div>
                    )
                })
            }
        </div>
    </section>
  )
}

export default OurMission

const goal=[
  {
    "title": "Quality First",
    "description": "Every product is carefully curated and tested to meet our exceptional standards.",
    "icon": <FaCheckCircle className='bg-green-200/40 h-12 w-12 p-3 rounded-full text-green-500 '/>
  },
  {
    "title": "Customer Focus",
    "description": "Your satisfaction drives every decision we make, from product selection to service delivery.",
    "icon": <FaUserCheck className='bg-blue-200/40 h-12 w-12 p-3 rounded-full text-blue-500'/>
  },
  {
    "title": "Innovation",
    "description": "We continuously evolve our platform and processes to enhance your shopping experience.",
    "icon": <FaLightbulb className='bg-yellow-200/40 h-12 w-12 p-3 rounded-full text-yellow-500'/>
  }
]
