import React from "react";
import { Switch, Route } from "react-router-dom";

import About from "../../views/examples/About";
import Home from "../../views/examples/Home";
import Param from "../../views/examples/Param";
import NotFound from "../../views/examples/NotFound";

import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles((theme) => ({
  Content: {
    
  },
}));

export default function Content(props) {
  const classes = useStyles();

  return (
    <div className={classes.Content}>
      <Switch>
        <Route path="/about">
          <About />
        </Route>
        <Route path="/param/:id">
          <Param />
        </Route>
        <Route exact path="/">
          <Home />
        </Route>
        <Route path="*">
          <NotFound />
        </Route>
      </Switch>
    </div>
  );
}
