import React from "react";
import Hero from "../components/home/Hero";
import OfferBanners from "../components/home/OfferBanners";
import BestSellers from "../components/home/BestSellers";
import NewArrivals from "../components/home/NewArrivals";
import JournalSection from "../components/home/JournalSection";

const Home = () => {
  return (
    <div>
      <Hero />
      <OfferBanners />
      <BestSellers />
      <NewArrivals />
      <JournalSection />
    </div>
  );
};

export default Home;
