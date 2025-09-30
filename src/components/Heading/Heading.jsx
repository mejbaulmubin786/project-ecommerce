import React from 'react'

const Heading = (props) => {
  return (
                <div className='w-fit mx-auto'>
                <h2 className='text-zinc-800 text-3xl sm:text-4xl md:text-5xl font-bold'>
                    <span className='text-orange-500'>{props.highlight} </span>
                    {props.heading}</h2>
                     <div className='h-1 w-34 bg-orange-500 ml-auto md:mt-6 mt-3'>
                     </div>
                     </div>
  )
}

export default Heading