import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Scholar from './Scholar';

class App extends Component {
  render() {
    return (

        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />

         <h1>Scholaraise</h1>

          <Scholar />
    </div>
    );
  }
}

export default App;
