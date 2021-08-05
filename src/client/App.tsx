import * as React from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import './scss/app';
import Navbar from "./components/Navbar";
import Home from "./components/Home";
import Comments from "./components/Comments";
import Locations from "./components/Locations";
import About from "./components/About";


export default function App() {
  return (
    <Router>
      <div>
        <Navbar />

        <Switch>
          <Route exact path="/">
            <Home />
          </Route>
          <Route exact path="/locations">
            <Locations />
          </Route>
          <Route exact path="/about">
            <About />
          </Route>
          <Route exact path="/comments">
            <Comments />
          </Route>
          {/* <Route exact path="/locations/:locationid">
            <LocationId />
          </Route> */}
        </Switch>
      </div>
    </Router>
  );


	// async componentDidMount() {
	// 	try {
		
	// 	} catch (error) {
	// 		console.log(error);
	// 	}
	// }

		
	}

interface IAppProps { }

interface IAppState {
	recycleCenters: Array<{ name: string, address: string, hours: string, id: number, countyid: number }>;
}

{/* <main className="container my-5">
				<h1 className="text-primary text-center">Recycle Centers</h1>
				<ul className="list-group">
					{this.state.recycleCenters.map(recycleCenter => {
						return <li className="list-group-item">{recycleCenter.name}</li>
					})}
				</ul>
			</main> */}

			// let r = await fetch('/api/recycleCenters');
			// let recycleCenters = await r.json();
			// this.setState({ recycleCenters });