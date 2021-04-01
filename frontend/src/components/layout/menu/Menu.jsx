import React from "react";
import UserIcon from "../../../images/user.png";
import { Link } from "react-router-dom";

import Sidebar from "./sidebar/Sidebar";
import {
  Toolbar,
  Typography,
  Avatar,
  List,
  ListItem,
  ListItemText,
} from "@material-ui/core";

import useStyles from "./MenuStyle";

export default function Menu(props) {
  const style = useStyles();

  return (
    <div className={style.root}>
      <Toolbar>
        <Sidebar />
        <Typography variant="h6" className={style.title}>
          Monitoramento de casos COVID-19
        </Typography>
        <List
          component="nav"
          aria-labelledby="main navigation"
          className={style.navDisplayFlex}
        >
          <Link to="/#" className={style.linkText}>
            <ListItem className={style.navListItem}>
              <ListItemText
                primary={"Área restrita"}
                classes={{ primary: style.navListItemText }}
              />
            </ListItem>
          </Link>
          <Link to="/#" className={style.linkText}>
            <ListItem className={style.navListItem}>
              <ListItemText
                primary={"Área restrita"}
                classes={{ primary: style.navListItemText }}
              />
            </ListItem>
          </Link>
          <Link to="/#" className={style.linkText}>
            <ListItem className={style.navListItem}>
              <ListItemText
                primary={"Área restrita"}
                classes={{ primary: style.navListItemText }}
              />
            </ListItem>
          </Link>
          <Link to="/#" className={style.linkText}>
            <ListItem className={style.navListItem}>
              <ListItemText
                primary={"Área restrita"}
                classes={{ primary: style.navListItemText }}
              />
            </ListItem>
          </Link>
        </List>
        <Avatar src={UserIcon} />
      </Toolbar>
    </div>
  );
}
