import React, { useState, useEffect } from 'react';
import { Link } from "react-router-dom";



export default function About() {
    const [people, setPeople] = useState([]);






// useEffect(() => {
//         fetch("https://ghibliapi.herokuapp.com/people")
//             .then(res => res.json())
//             .then(people => setPeople(people))
//             .catch(err => console.error(err));
//     }, []);

    return (
        <>
            <h1>About</h1>
            <div className="container">
         
            </div>
        </>
    )


};