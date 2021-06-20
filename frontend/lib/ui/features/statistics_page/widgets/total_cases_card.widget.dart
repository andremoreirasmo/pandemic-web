import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';

class TotalCasesCard extends StatefulWidget {
  final Color color;

  final String name;
  final String data;
  final IconData icon;
  TotalCasesCard({
    this.color,
    this.data,
    this.name,
    this.icon,
  });
  @override
  _TotalCasesCardState createState() => _TotalCasesCardState();
}

class _TotalCasesCardState extends State<TotalCasesCard> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final formatter = new NumberFormat("#,##0.00", "pt_BR");
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (value) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 275),
        height: hovered ? (size.height * 0.15) : (size.height * 0.145),
        width: hovered ? (size.width * 0.25) : (size.width * 0.245),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ColorsModel.primaryBlueColorDark, blurRadius: 2)
          ],
          borderRadius: BorderRadius.circular(16),
          color: ColorsModel.primaryBlueColorDark,
        ),
        // height: hovered ? 100.0 : 105.0,
        // width: hovered ? 170.0 : 165.0,
        // decoration: BoxDecoration(
        //     color: hovered ? widget.color : Colors.white,
        //     borderRadius: BorderRadius.circular(15.0),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black12,
        //         blurRadius: 20.0,
        //         spreadRadius: 5.0,
        //       ),
        //     ]),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 18.0,
                  ),
                  Container(
                    height: 30.0,
                    width: 30.0,
                    child: Icon(
                      widget.icon,
                      // color: !hovered ? Colors.white : Colors.black,
                      color: Colors.black,
                      size: 16.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: hovered ? widget.color : Colors.white,
                      // color: Colors.white
                    ),
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Container(
                    child: SelectableText(
                      widget.name,
                      style: AppTextStyles.subtitle.copyWith(
                          // color: hovered ? Colors.white : Colors.black,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              // * case infos
              Center(
                child: SelectableText(
                  formatter.format(double.parse(widget.data)),
                  style: AppTextStyles.subtitle.copyWith(
                      // color: hovered ? Colors.white : Colors.black,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
