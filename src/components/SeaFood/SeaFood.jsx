import React from 'react'
import Banner from '../Banner/Banner'
import CategoryPage from '../CategoryPage/CategoryPage'
import seafood from '../../assets/seafood-banner.webp'

const SeaFood = () => {
  return (
    <div>
        <CategoryPage title="Meat and Seafood" bgImage={seafood} categories={["Meat & Seafood"]}/>
    </div>
  )
}

export default SeaFood