import React, { use, useRef } from 'react'
import { Swiper, SwiperSlide } from 'swiper/react';
import { Navigation } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import Heading from '../Heading/Heading'
import user1 from '../../assets/customer1.webp'
import user2 from '../../assets/customer2.webp'
import user3 from '../../assets/customer3.webp'
import user4 from '../../assets/customer4.webp'
import user5 from '../../assets/customer5.webp'
import { IoIosArrowBack, IoIosArrowForward } from 'react-icons/io'
import { FaStar } from 'react-icons/fa';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/all';
import { useGSAP } from '@gsap/react';

gsap.registerPlugin(ScrollTrigger)
const Testimonial = () => {
    const containerRef=useRef()
    useGSAP(()=>{
        gsap.from(".container-btn",{
             opacity:0,
                x:200,
                duration:0.3,
                ease:'power3.out',
                scrollTrigger:{
                    trigger:".container-card",
                    scrub:1,
                    // markers:true,
                    start:"top 100%",
                    end:"bottom 90%"
                }
        })
        gsap.from(".container-card",{
             opacity:0,
                y:100,
                scale:0.7,
                transformOrigin:"center center",
                duration:1,
                ease:'back.inOut',
                scrollTrigger:{
                    trigger:".container-card",
                    scrub:1,
                    // markers:true,
                    start:"top 150%",
                    end:"bottom 90%"
                }
        })
    },{scope:containerRef})

    return (
        <section ref={containerRef}>
            <div className='max-w-[1400px] mx-auto px-10 py-20 overflow-x-hidden'>
                <Heading highlight="Customer" heading="Saying" />
                <div className='container-btn flex justify-end mt-5 gap-x-3 py-5'>
                    <button className='custom-prev text-2xl bg-zinc-100 rounded-lg text-zinc-800 hover:bg-gradient-to-b from-orange-400 to-orange-500 hover:text-white w-11 h-11 flex justify-center items-center'><IoIosArrowBack /></button>
                    <button className='custom-next text-2xl  bg-zinc-100 rounded-lg text-zinc-800 hover:bg-gradient-to-b from-orange-400  to-orange-500 hover:text-white w-11 h-11 flex justify-center items-center'><IoIosArrowForward /></button>
                </div>
                <Swiper 
                navigation={{
                    nextEl:".custom-next",
                    prevEl:".custom-prev"

                }} 
                loop={true}
                breakpoints={{
                    640:{slidesPerView:1, spaceBetween:20},
                    768:{slidesPerView:2, spaceBetween:20},
                    1024:{slidesPerView:3, spaceBetween:20},
                }}
                modules={[Navigation]} className="mySwiper">
                    {
                        review.map((item) => {
                            return (
                                <SwiperSlide key={item.id} className='container-card gpu-boost bg-zinc-100 p-8 rounded-xl'>
                                    <div className="flex gap-5 items-center">
                                        <div className='w-16 h-16 rounded-full outline-2 outline-orange-500 outline-offset-4 overflow-hidden'>

                                            <img src={item.image} className='w-full h-full' />
                                        </div>
                                        <div>
                                            <h5 className='text-xl font-bold'>{item.name}</h5>
                                            <p className='text-zinc-600'>{item.profession}</p>
                                            <span className='flex text-yellow-400 mt-3 text-xl gap-1'>
                                                {Array.from({length:item.rating},(_,index)=>(
                                                    <FaStar key={index}/>
                                                ))}
                                            </span>
                                        </div>
                                    </div>
                                    <div className='mt-10 min-h-[15vh]'>
                                        <p className='text-zinc-600'>{item.para}</p>
                                    </div>
                                </SwiperSlide>
                            )
                        })
                    }
                </Swiper>

            </div>
        </section>
    )
}

export default Testimonial

const review = [
    {
        id: 1,
        name: "Emily Johnson",
        profession: "Food Blogger",
        rating: 3,
        para: "Grocify is my go-to store for all grocery needs. Their product is always fresh, and the delivery is super fast. I love the user-friendly interface and variety of organic options!",
        image: user1,
    },
    {
        id: 2,
        name: "David Smith",
        profession: "Chef",
        rating: 4,
        para: "As a chef, quality ingredients are everything. Grocify consistently delivers the best vegetables, herbs, and pantry staples. Highly recommended!",
        image: user2,
    },
    {
        id: 3,
        name: "Alya Thompson",
        profession: "Nutritionist",
        rating: 5,
        para: "I always recommend Grocify to my clients. The selection of healthy and organic products makes it easy to stick to a balanced diet. Excellent service!",
        image: user3,
    },
    {
        id: 4,
        name: "Michael Lee",
        profession: "Home Cook",
        rating: 4,
        para: "Ordering from Grocify has made my weekly grocery shopping so much easier. Everything arrives fresh and on time. The quality is consistently great!",
        image: user4,
    },
    {
        id: 5,
        name: "Priya Verma",
        profession: "Health Coach",
        rating: 5,
        para: "Grocify is a game-changer! The produce is always crisp, and I love the range of local and organic items. Their customer service is also top-notch.",
        image: user5,
    },
]
