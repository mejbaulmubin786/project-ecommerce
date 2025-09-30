import React from 'react'
import bgAll from '../../assets/all-banner.webp'
import CategoryPage from '../CategoryPage/CategoryPage'

const AllProducts = () => {
  return (
    <div>
          <CategoryPage  title="All Products" bgImage={bgAll} categories={["All"]}/>
    </div>
  )
}

export default AllProducts