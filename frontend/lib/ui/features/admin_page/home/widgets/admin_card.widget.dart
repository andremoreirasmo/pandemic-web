import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pandemicweb/shared/widgets/app_button.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';

class AdminCard extends StatelessWidget {
  final String title;
  final String description;
  final String asset;
  final Function callback;

  AdminCard({this.title, this.description, this.callback, this.asset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: <Color>[
                ColorsModel.primaryColorDark,
                ColorsModel.primaryBlueColorLight,
                ColorsModel.primaryColor,
                ColorsModel.primaryColorDark,
              ],
            ),
            boxShadow: [
              BoxShadow(color: ColorsModel.primaryLight, blurRadius: 3)
            ],
            borderRadius: BorderRadius.circular(16),
            color: ColorsModel.primaryBlueColorLight),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SelectableText(
                    title,
                    style: AppTextStyles.titleBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SelectableText(
                    description,
                    style: AppTextStyles.subtitle,
                  ),
                ),
                SizedBox(height: 200),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppButton(
                    text: 'Ver ${title}',
                    style:
                        AppTextStyles.description.copyWith(color: Colors.black),
                    callback: callback,
                    color: ColorsModel.primaryLight,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: SvgPicture.asset(
                  asset,
                  fit: BoxFit.cover,
                  height: 400,
                  width: 400,
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
