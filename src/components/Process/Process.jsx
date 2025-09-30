import React, { useRef } from 'react'
import Heading from '../Heading/Heading'
import { TbCircleNumber1Filled, TbCircleNumber2Filled, TbCircleNumber3Filled, TbCircleNumber4Filled } from 'react-icons/tb'
import { PiFactory, PiPlant } from "react-icons/pi";
import { SlBadge } from "react-icons/sl";
import { BsTruck } from "react-icons/bs";
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/all';
import { useGSAP } from '@gsap/react';

gsap.registerPlugin(ScrollTrigger)

const Process = () => {
    const containerRef=useRef()
    useGSAP(()=>{
        const cards=gsap.utils.toArray(".container-card")
        cards.forEach((card,i)=>{
            gsap.from(card,{
                opacity:0,
                y:100,
                scale:0.5,
                duration:0.5,
                ease:'power3.out',
                scrollTrigger:{
                    trigger:card,
                    scrub:1,
                    // markers:true,
                    start:"top 100%",
                    end:"bottom 90%"
                }
            })
        })
    },{scope:containerRef})




    const renderSteps=steps.map(item=>{
        return(
            <div key={item.id} className={`container-card flex-1 min-w-[300px] lg:min-w-0 ${item.id%2===0?'md:-mt-100':''}`}>
                <span className=' flex rounded-full mx-auto justify-center items-center w-18 h-18 text-white text-8xl bg-zinc-800 outline-[3px] outline-offset-7 outline-zinc-800 outline-dashed'>{item.number}</span>
                <div className='flex items-center gap-x-5 mt-10'>
                        <span className='flex justify-center items-center w-15 h-15 rounded-full bg-gradient-to-b from-orange-400 to-orange-500 text-white text-3xl'> {item.icon}</span>
                    <div className='flex-1'>
                        <h4 className='text-zinc-800 font-bold text-2xl'>{item.title}</h4>
                        <p className='text-zinc-600 mt-2'>{item.para}</p>
                    </div>
                </div>
            </div>
        )
    })
  return (
    <section ref={containerRef}>
        <div className='max-w-[1400px] mx-auto px-10 py-20'>
            <div className='w-fit mr-auto'>
                <Heading highlight="Our" heading="Process"/>
            </div>
        <div className='flex gap-y-17 flex-wrap md:mt-20 mt-10 items-center justify-center md:pt-50'>{renderSteps}</div>
        </div>
    </section>
  )
}

export default Process

const steps=[
    {
        id:1,
        number:<TbCircleNumber1Filled />,
        title:"Sourcing",
        para:"It is a long established fact that a reader",
        icon:<PiPlant/>,
    },
    {
        id:2,
        number:<TbCircleNumber2Filled />,
        title:"Manufacturing",
        para:"It is a long established fact that a reader",
        icon:<PiFactory />,
    },
    {
        id:3,
        number:<TbCircleNumber3Filled />,
        title:"Quality Control",
        para:"It is a long established fact that a reader",
        icon:<SlBadge />,
    },
    {
        id:4,
        number:<TbCircleNumber4Filled />,
        title:"Logistics",
        para:"It is a long established fact that a reader",
        icon:<BsTruck />,
    },
]