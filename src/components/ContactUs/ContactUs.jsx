import React, { useRef } from 'react';
import chat from '../../assets/chat.png';
import Button from '../Button/Button';
import { useGSAP } from '@gsap/react';
import gsap from 'gsap';

const ContactUs = () => {
  const containerRef=useRef()
  useGSAP(()=>{
    gsap.from(containerRef.current,{
      opacity:0,
      scale:0.5,
      y:100,
      duration:0.3,
      ease:'back.in'
    })
  })
  return (
    <div ref={containerRef} className='max-w-[1400px] mx-auto px-4 md:px-10 flex flex-col md:flex-row justify-center items-center mt-35 md:mt-55 lg:mt-35 pb-20'>
        <div className='relative w-full max-w-[500px] sm:max-w-[600px] md:max-w-[650px] lg:max-w-[700px] xl:max-w-[750px] mx-auto px-4'>
        {/* Floating image */}
        <img
          src={chat}
          alt='chat'
          className='hidden md:block md:absolute w-30 h-30 -top-10 -left-15 z-10 transition-transform duration-300 hover:scale-120 hover:-translate-x-4 hover:translate-y-2'
        />
      <div className='bg-white shadow-2xl shadow-orange-500  md:rounded-br-full md:rounded-l-none rounded-b-full overflow-hidden relative'>


        {/* Heading */}
        <div>
          <h1 className='text-center text-white bg-gradient-to-b from-orange-400 to-orange-500 py-2 text-2xl font-bold'>
            Contact Us
          </h1>
        </div>

        {/* Form */}
        <div className='bg-orange-100 px-6 sm:px-10 pt-8 md:pt-16 md:py-20 pb-30'>
          <form>
            {/* Name */}
            <div className='max-w-[500px] md:max-w-[400px]'>
              <h3 className='text-zinc-800 font-semibold text-xl'>Name:</h3>
              <input
                type='text'
                placeholder='Type Your Name'
                className='mt-2 py-2 px-3 w-full outline-none bg-white rounded-md border-2 border-orange-300 focus:border-orange-500 transition-colors duration-200'
              />
            </div>

            {/* Email */}
            <div className='max-w-[500px] md:max-w-[400px]'>
              <h3 className='text-zinc-800 font-semibold text-xl mt-2'>Email:</h3>
              <input
                type='email'
                placeholder='Type Your Email'
                className='mt-2 py-2 px-3 w-full outline-none bg-white rounded-md border-2 border-orange-300 focus:border-orange-400 transition-colors duration-200'
              />
            </div>

            {/* Phone */}
            <div className='max-w-[500px] md:max-w-[400px]'>
              <h3 className='text-zinc-800 font-semibold text-xl mt-2'>Phone:</h3>
              <input
                type='number'
                placeholder='Type Your Phone Number'
                className='mt-2 py-2 px-3 w-full  outline-none bg-white rounded-md border-2 border-orange-300 focus:border-orange-400 transition-colors duration-200 mr-3'
              />
            </div>

            {/* Submit Button */}
            <div className='mt-3'>
              <button
                type='submit'
                className='bg-gradient-to-b from-orange-400 to-orange-500 text-white text-xl px-3 py-1 rounded-full hover:to-orange-600 cursor-pointer transition-all duration-200 font-semibold'
              >
                Submit
              </button>
            </div>
          </form>
        </div>
        </div>
      </div>
    </div>
  );
};

export default ContactUs;
