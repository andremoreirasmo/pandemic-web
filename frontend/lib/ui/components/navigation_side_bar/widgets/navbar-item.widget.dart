import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final bool active;

  const NavBarItem({Key key, this.icon, this.onTap, this.active})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white,
        hoverColor: Colors.white12,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            children: [
              Flexible(
                child: Container(
                  height: 60.0,
                  width: 40.0,
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 475),
                        height: 35.0,
                        width: 5.0,
                        decoration: BoxDecoration(
                          color: active ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Icon(
                          icon,
                          color: active ? Colors.white : Colors.white54,
                          size: 19.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
