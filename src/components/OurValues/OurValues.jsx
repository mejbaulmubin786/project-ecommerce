import React, { useRef } from 'react'
import Heading from '../Heading/Heading'
import { IoHeart, IoLeaf, IoShield } from "react-icons/io5";
import { FaLeaf } from 'react-icons/fa';
import basket from "../../assets/basket-full-vegetables.webp"
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/all';
import { useGSAP } from '@gsap/react';

gsap.registerPlugin(ScrollTrigger);


const OurValues = () => {

const container=useRef()

useGSAP(()=>{
    const cards1=gsap.utils.toArray(".container-card1")
    cards1.forEach((card1,i)=>{
        gsap.from(card1,{
                opacity:0,
                y:100,
                scale:0.2,
                duration:1,
                ease:'back.inOut',
                scrollTrigger:{
                    trigger:card1,
                    start:"top 120% ",
                    end:"bottom 90%",
                    // markers:true,
                    scrub:1,
                }
            })
        })

        gsap.from(".basket-img",{
            opacity:0,
                y:100,
                scale:0.2,
                duration:1,
                ease:'back.inOut',
                scrollTrigger:{
                    trigger:".basket-img",
                    start:"top 120% ",
                    end:"bottom 90%",
                    // markers:true,
                    scrub:1,
                }
        })


        const cards2=gsap.utils.toArray(".container-card2")
        cards2.forEach((card2,i)=>{
            gsap.from(card2,{
                opacity:0,
                y:100,
                scale:0.2,
                duration:1,
                ease:'back.inOut',
                scrollTrigger:{
                    trigger:card2,
                    start:"top 120% ",
                    end:"bottom 90%",
                    // markers:true,
                    scrub:1,
                }
            })
        })
},{scope:container})


const leftvalue=value.slice(0,2).map(item=>{
        return(
            <div key={item.id} className='container-card1 flex md:flex-row-reverse items-center gap-7'>
                <div>
                    <span className='bg-gradient-to-b from-orange-400 to-orange-500 w-15 h-15 rounded-full flex justify-center items-center text-3xl text-white'>{item.icon}</span>
                </div>
                <div className='md:text-right'>
                    <h3 className='text-3xl font-bold text-zinc-800'>{item.title}</h3>
                    <p className='text-zinc-600 mt-2'>{item.para}</p>
                </div>
            </div>
        )
    })
    const rightvalue=value.slice(2).map(item=>{
        return(
            <div key={item.id} className='container-card2 flex items-center gap-7'>
                <div>
                    <span className='bg-gradient-to-b from-orange-400 to-orange-500 w-15 h-15 rounded-full flex justify-center items-center text-3xl text-white'>{item.icon}</span>
                </div>
                <div>
                    <h3 className='text-3xl font-bold text-zinc-800'>{item.title}</h3>
                    <p className='text-zinc-600 mt-2'>{item.para}</p>
                </div>
            </div>
        )
    })
  return (
        <section>
            <div ref={container} className='max-w-[1400px] mx-auto px-10 py-10'>
                <Heading highlight="Our" heading="Values" />

                <div className='flex md:flex-row flex-col md:gap-5 gap-15 mt-15'>
                    {/*left values*/}
                    <div className='flex flex-col gap-15 justify-between md:min-h-100'>{leftvalue}</div>
                    {/*center image*/}
                    <div className='basket-img md:flex w-1/2 hidden'>
                        <img src={basket} className='object-contain h-90 w-90'/>
                    </div >
                    {/*right values*/}
                    <div className='flex flex-col gap-15 justify-between md:min-h-100'>
                        {rightvalue}
                    </div>

                    {/* <h3 className='font-bold text-3xl text-zinc-800'>Trust</h3>
                    <p className='text-zinc-600'>It is a long established fact that a reader will be distracted by the readable</p>
                    <p className='flex-1'><IoHeart /></p> */}
                
            
        </div>
        </div>
    </section>
  )
}

export default OurValues

const value=[
    {
        id:1,
        title:"Trust",
        para:"It is a long established fact that a reader will be distracted by the readable",
        icon:<IoHeart/>
    },
    {
        id:2,
        title:"Always Fresh",
        para:"It is a long established fact that a reader will be distracted by the readable",
        icon:<IoLeaf/>
    },
    {
        id:3,
        title:"Food Safety",
        para:"It is a long established fact that a reader will be distracted by the readable",
        icon:<IoShield/>
    },
    {
        id:4,
        title:"100% Organic",
        para:"It is a long established fact that a reader will be distracted by the readable",
        icon:<FaLeaf/>
    },
]