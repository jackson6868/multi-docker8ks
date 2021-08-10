import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
           Fib calc ver 3
          </a>
          <Link to="/">Home</Link>
          <Link  to="/otherpage">Other Pagd22e21</Link>
          <Link to="/dashboard">dashboard</Link>
        </header>
        <div>
        
      <Route exact path="/" component={ Fib } />
      <Route path="/otherpage" component={ OtherPage } />  
      {/* <Route path="/Dashboard" ><Dashboard /></Route>  */}
  
        </div>
      </div>
    </Router>
  );

  function Dashboard() {
    return (
      <div>
        <h2>Dashboard2233</h2>
      </div>
    );
  }

}

export default App;
