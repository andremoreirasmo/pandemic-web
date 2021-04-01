import './App.css';
import React from "react";
import Menu from "../components/layout/menu/Menu";
import Content from "../components/layout/Content";
import { BrowserRouter as Router } from "react-router-dom";

const App = (props) => (
  <Router>
    <Menu />    
      <Content />
  </Router>
);

export default App;
