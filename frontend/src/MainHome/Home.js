import "../script.js";

import "../style.css";

import img from "../images/logo.webp"

import { faStar, faPlus } from "@fortawesome/free-solid-svg-icons";

import { library } from "@fortawesome/fontawesome-svg-core";

library.add(faStar);

export default function Home() {
  return (
    <div className="credit text-center">


        <h1 className="credit text-center">Welcome to Buidlmart</h1>
        <img  src={img} style={{width:"500px", height:"300px"  }} alt="pic"/>

        <div className="swiper-button-next"></div>
        <div className="swiper-button-prev"></div>

      

    

    

    </div>
  );
}
