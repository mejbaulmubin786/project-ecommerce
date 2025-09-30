import React from 'react'

const Banner = ({title,bgImage}) => {
  return (
    <div className=' h-[50vh] mt-25 flex justify-center items-center relative bg-center bg-cover'
    style={{backgroundImage:`url(${bgImage})`}}>
        <h2 className='md:text-5xl text-2xl text-white border border-white/30 bg-white/5 backdrop-blur-[5px]  p-5 rounded-xl font-bold z-10 shadow-lg '>{title}</h2>
        <div className='bg-black/50 absolute inset-0'></div>
    </div>
  )
}

export default Banner