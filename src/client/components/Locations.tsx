import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";


export default function Locations() {
  const [locations, setLoctations] = useState([]);

  useEffect(() => {
    fetch("/api/recycleCenters")
      .then((res) => res.json())
      .then((locations) => setLoctations(locations))
      .catch((err) => console.error(err));
  }, []);

  return (
    <>
      <h1>Locations</h1>

      <div className="container">
        <div className="row justify-content-around">
          {locations.map((locations) => (
            <div key={locations.id} className="card my-3" style={{ width: "24rem" }}>
              <div className="card-body">
                <h5 className="card-title">{locations.name}</h5>
                <h6 className="card-subtitle mb-2">Address: {locations.address}</h6>
                <h6 className="card-subtitle mb-2">Hours: {locations.hours}</h6>
                <h6 className="card-subtitle mb-2">Materials Accepted: {locations.materials}</h6>
                <h6 className="card-subtitle mb-2">County: {locations.countyid}</h6>
              </div>
            </div>
          ))}
        </div>
      </div>
    </>
  );
}
