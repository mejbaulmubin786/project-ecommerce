import React, { useEffect, useRef, useState } from 'react'
import Heading from '../Heading/Heading'
import ProductList from '../../components/ProductList/ProductList'
import { AiOutlineAppstore } from "react-icons/ai";
import { GiFruitBowl } from "react-icons/gi";
import { GiMilkCarton } from "react-icons/gi";
import { TbMeat } from "react-icons/tb";
import { FaCarrot} from 'react-icons/fa'
import Cards from '../Cards/Cards'
import { Link } from 'react-router-dom'
import gsap from 'gsap'
import { useGSAP } from '@gsap/react'
import { ScrollTrigger } from 'gsap/all'

gsap.registerPlugin(ScrollTrigger)

const Products = () => {
    const containerRef=useRef() // this line is for gsap

    useGSAP(()=>{
        gsap.from(".category-btn",{
            opacity:0,
            y:50,
            duration:1,
            stagger:0.3,
            ease:'back.inOut',
            scrollTrigger:{
                trigger:".category-btn",
                start:"top 100%",
                end:"bottom 60%",
                // markers:true,
                scrub:2
            }
        })
        
    },{scope:containerRef})



    
    const categoryIcons = {
    All:AiOutlineAppstore,
    Fruits: GiFruitBowl,
    Vegetables: FaCarrot,
    Dairy: GiMilkCarton,
    "Meat & Seafood": TbMeat
    }

    const  categories=["All","Fruits","Vegetables","Dairy","Meat & Seafood"]
    const [activeTab, setactiveTab] = useState("All");

    // useEffect(() => {
    // ScrollTrigger.refresh();
    // }, [activeTab]);

    
  return (
    <section>
    <div ref={containerRef} className='max-w-[1400px] mx-auto px-10 py-20'>
        <Heading highlight="Our" heading="Products"/>
        {/*tabs*/}
        <div className='md:flex  md:gap-3 grid grid-cols-2 gap-8 justify-center mt-10'>
            {categories.map(category=>{
                const Icon = categoryIcons[category];
                return (
                    <div key={category} className='category-btn flex flex-col items-center'>
                    <div className='gpu-boost tab-btn w-18 h-18 p-1 mb-4 flex items-center justify-center'>
                    <Icon 
                    className={`w-full h-full p-3  transform  transition-transform duration-300 border-2 rounded-full 
                    ${activeTab===category?"text-white scale-120 -translate-y-3  drop-shadow-xl drop-shadow-orange-500 border-white  bg-gradient-to-b from-orange-400 to-orange-500":"bg-white border-orange-500 text-orange-500"}`}
                    onClick={()=>setactiveTab(category)}
                    />
                    </div>
                    <button   className={`px-5 py-2 text-lg cursor-pointer rounded-lg 
                        ${activeTab===category?"bg-gradient-to-b from-orange-400 to-orange-500 text-white":"bg-zinc-100"} `} onClick={()=>setactiveTab(category)}>
                        {category}
                    </button>
                    </div>
                )
            })}
        </div>
        {/* product listing */}
        {categories.map(category => {
                    const filteredItems = category === "All"
                        ? ProductList
                        : ProductList.filter(item => item.category === category);

                    return (
                        <div
                            key={category}
                            className={`${activeTab === category ? "grid" : "hidden"} grid-cols-1 md:grid-cols-3 lg:grid-cols-4 lg:gap-9 gap-5 mt-20`}
                        >
                            {filteredItems.slice(0, 8).map(product => (
                                <Cards
                                    key={product.id}
                                    image={product.image}
                                    name={product.name}
                                    price={product.price}
                                />
                            ))}
                        </div>
                    )
                })}

        <div className='mt-15 mx-auto w-fit'>
            <Link to="/allproducts" className='bg-gradient-to-b from-orange-400 to-orange-500 text-white px-8 py-3 rounded-lg text-lg hover:scale-105 hover:to-orange-600 transition-all duration-300 cursor-pointer'>View All</Link>
        </div>
        </div>
    </section>
  )
}

export default Products