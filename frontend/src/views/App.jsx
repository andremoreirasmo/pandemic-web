import "./App.css";
import React from "react";
import Menu from "../components/layout/menu/Menu";

import { BrowserRouter as Router } from "react-router-dom";

import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles((theme) => ({
  container: {
    display: "flex",
    flexDirection: "column"
  },
}));

export default function App(props) {
  const classes = useStyles();

  return (
    <Router>
      <div className={classes.container}>
        <Menu />        
      </div>
    </Router>
  );
}
