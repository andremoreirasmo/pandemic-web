import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pandemicweb/shared/widgets/app_button.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/assets_model.dart';
import 'package:pandemicweb/shared/utils/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _firstWidget() {
      return Container(
        height: 400,
        width: size.width * 0.8,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  "Os doutores dizem",
                  style: AppTextStyles.titleBold
                      .copyWith(color: Color(0xFF624897), fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText(
                  "Fique em casa e\nsalve o mundo",
                  style: AppTextStyles.subtitle
                      .copyWith(color: Color(0xFFb7b6bd), fontSize: 26),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText(
                  "dkaslçdklçsalçdkalsçkdlçaçldlçasdlçsalçkdlçsaklçdsallasdklds\ndkaslçdklçsalçdkalsçkdlçaçldlçasdlçsalçkdlçsaklçdsallasdklds",
                  style: AppTextStyles.description.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                  text: "COMEÇAR",
                  color: Color(0xFF664b9d),
                  callback: () {},
                ),

                // MouseRegion(
                //   cursor: SystemMouseCursors.text,
                //   child: InkWell(
                //     child: Container(
                //       width: 200,
                //       height: 60,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(6),
                //           color: Color(0xFF664b9d)),
                //       child: Center(
                //         child: Text(
                //           "COMEÇAR",
                //           style: AppTextStyles.subtitle
                //               .copyWith(color: Colors.grey[200]),
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                child: Image.asset(
                  AssetsModel.generic_picture_1,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 80),
      child: Column(
        children: [_firstWidget()],
      ),
    );
  }
}
