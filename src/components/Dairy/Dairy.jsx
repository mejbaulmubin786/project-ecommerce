import React from 'react'
import Banner from '../Banner/Banner'
import CategoryPage from '../CategoryPage/CategoryPage'
import dairy from '../../assets/dairy-banner.webp'

const Dairy = () => {
  return (
    <div>
        <CategoryPage title="Dairy and Eggs" bgImage={dairy} categories={["Dairy"]}/>
    </div>
  )
}

export default Dairy