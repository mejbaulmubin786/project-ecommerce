import React from 'react'
import CategoryPage from '../CategoryPage/CategoryPage'
import bgfruits from '../../assets/fruits-banner.webp'

const Fruits = () => {
  return (
    <div>
        <CategoryPage title="Fruits and Veggies" bgImage={bgfruits} categories={["Fruits","Vegetables"]}/>
    </div>
  )
}

export default Fruits