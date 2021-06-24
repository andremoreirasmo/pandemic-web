import 'package:flutter/material.dart';
import 'package:pandemicweb/shared/utils/assets_model.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';

class HowToGetCovidCard extends StatelessWidget {
  final String title;
  final String description;
  final String asset;
 

  HowToGetCovidCard({this.title, this.description, this.asset});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.05,
              color: ColorsModel.primaryBlueColorLight,
              child: Image.asset(asset),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: SelectableText(
                title,
                style: AppTextStyles.subtitle.copyWith(
                  color: Color(0xFFb7b6bd),
                ),
              ),
            ),
            Container(
              width: size.width*0.22,
              child: SelectableText(
             description,
              style: AppTextStyles.description.copyWith(
              color: Colors.grey[600],
              ),
            ),
            )
          ],
        );
  }
}
