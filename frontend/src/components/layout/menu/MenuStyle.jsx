import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  appBar: {
    background: "#282b2e",
    boxShadow: "none"
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  },
  navDisplayFlex: {
    display: "flex",
    justifyContent: "space-between",    
    paddingRight: "5rem"
  },
  navListItem: {
    paddingLeft: 20,
    paddingRight: 20,
  },
  linkText: {
    textDecoration: "none",
    color: "white",
  },
  navListItemText: {
    fontSize: "15px"
  },
}));

export default useStyles;
