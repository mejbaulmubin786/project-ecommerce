import React,{useState,useEffect, useRef} from 'react'
import { IoHeart } from "react-icons/io5";
import { FaSearch } from "react-icons/fa";
import { HiMiniShoppingBag } from "react-icons/hi2";
import { TbMenu2,TbMenu3 } from "react-icons/tb";
import { Link } from 'react-router-dom';
import { useGSAP } from '@gsap/react';
import gsap from 'gsap';


const Navbar = () => {

    const containerRef=useRef()
    useGSAP(()=>{
        gsap.to(containerRef.current,{
            opacity:1,
            y:0,
            duration:0.3,
            ease:'back.in'
        })
    })


    const [showMenu, setshowMenu] = useState(false)
    const toggle=()=>{
        setshowMenu(!showMenu);
    }
    const [scroll, setScroll] = useState(false)
    useEffect(() => {
        const handleScroll=()=>{
            setScroll(window.scrollY>10)
        }
        window.addEventListener('scroll',handleScroll);
        return ()=>window.removeEventListener('scroll',handleScroll)
    }, [])
    

    const scrollTop=()=>{
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
    const scrollTopInstant=()=>{
        window.scrollTo({ top: 0, behavior: 'auto' });
        setshowMenu(false);
    }

  return (
    <header ref={containerRef} style={{ transform: 'translateY(-400px)', opacity: 0 }} className={`bg-white fixed top-0 left-0 right-0  transition-all duration-300 z-100 ${scroll?'drop-shadow-[0_4px_25px_rgba(0,0,0,0.1)]':'null'}`}>
        <nav className='max-w-[1400px] md:h-[14vh]  h-[12vh] items-center px-10 mx-auto flex justify-between'>
            <Link to='/home' className='text-3xl font-semibold' onClick={scrollTop}>Gr<span className='text-orange-500 uppercase'>o</span>cify</Link>
            <ul className='lg:flex items-center  xl:text-lg gap-x-15 hidden font-semibold tracking-wider text-zinc-800'>
                <li>
                    <Link to="/home" onClick={scrollTopInstant} className='hover:text-orange-500'>Home</Link>
                </li>
                <li>
                    <Link to="/aboutus" onClick={scrollTopInstant} className='hover:text-orange-500'>About Us</Link>
                </li>
                <li>
                    <Link to="/processpage" onClick={scrollTopInstant} className='hover:text-orange-500'>Process</Link>
                </li>
                <li>
                    <Link to="/contactus" onClick={scrollTopInstant} className='hover:text-orange-500'>Contact Us</Link>
                </li>
            </ul>
            <div className='flex items-center gap-x-5'>
                <div className='md:flex p-1 border-2 border-orange-500 rounded-full hidden'>
                <input type="text" name="text" id="text" placeholder="Search...." autoComplete="off" 
                className='flex-1  h-10 px-3  focus:outline-none' />
                <button className='bg-orange-500 bg-gradient-to-b from-orange-400 to-orange-500
                 text-white h-10 w-10 flex justify-center items-center text-xl rounded-full px-2'><FaSearch /></button>
            
                </div>
                <a href="#" className='text-zinc-800 text-2xl'>
                    <IoHeart />
                </a>
                <a href="#" className='text-zinc-800 text-2xl'>
                    <HiMiniShoppingBag />
                </a>
                <div className='text-zinc-800 text-3xl lg:hidden ' onClick={toggle}>
                    {showMenu?<TbMenu3 />:<TbMenu2 />}
                </div>
            </div>
            {/*Mobile menu*/}
            <ul className={`flex flex-col md:w-full gap-y-12 bg-orange-500  rounded-xl p-10 absolute top-[100%] -left-full transform -translate-x-1/2 items-center gap-x-15 lg:hidden font-semibold tracking-wider text-white transition-all duration-500 ${showMenu?"left-1/2":''}`}>
                <li>
                    <Link to="/home" onClick={scrollTopInstant} className='hover:text-orange-500'>Home</Link>
                </li>
                <li>
                    <Link to="/aboutus" onClick={scrollTopInstant} className='hover:text-orange-500'>About Us</Link>
                </li>
                <li>
                    <Link to="/processpage" onClick={scrollTopInstant} className='hover:text-orange-500'>Process</Link>
                </li>
                <li>
                    <Link to="/contactus" onClick={scrollTopInstant} className='hover:text-orange-500'>Contact Us</Link>
                </li>
                <li className='flex p-1 border-2 border-orange-500 bg-white rounded-full md:hidden items-center'>
                <input type="text" name="text" id="text" placeholder="Search...." autoComplete="off" 
                className='flex-1 h-[5vh] px-3 focus:outline-none text-zinc-800' />
                <button className='bg-orange-500 bg-gradient-to-b from-orange-400 to-orange-500 text-white h-10 w-10 flex justify-center items-center text-xl rounded-full px-2'><FaSearch /></button>
            
                </li>
            </ul>
        </nav>
    </header>
  )
}

export default Navbar