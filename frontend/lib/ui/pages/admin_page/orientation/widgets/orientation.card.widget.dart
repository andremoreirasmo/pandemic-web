import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pandemicweb/shared/utils/app_button.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';

class OrientationCard extends StatelessWidget {
  final String title;
  final String description;
  final Function callback;

  OrientationCard({this.title, this.description, this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 20),
        child: Container(
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    0.8, 0.0), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  ColorsModel.primaryColorDark,
                  ColorsModel.primaryBlueColor,
                  ColorsModel.primaryColor,
                  ColorsModel.primaryColorDark,
                ],
              ),
              boxShadow: [
                BoxShadow(color: ColorsModel.primaryBlueColor, blurRadius: 1.5)
              ],
              borderRadius: BorderRadius.circular(16),
              color: ColorsModel.primaryBlueColor),
          child: Row(
            children: [
              Icon(
                Icons.description,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(title,
                            style: AppTextStyles.titleBold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.all(8),
                        child: SelectableText(
                          description,
                          style: AppTextStyles.description,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              padding: EdgeInsets.only(
                                  top: 32, left: 8, bottom: 8, right: 8),
                              child: AppButton(
                                text: 'Editar',
                                color: Colors.pink,
                                callback: () {},
                              )
                              //child: AppButton(text:'Editar',color: ColorsModel.primaryColorDark,textcolor: Colors.white,callback: (){}),
                              ),
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
}
