import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/ui/pages/admin/home/widgets/card.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Scrollbar(
        isAlwaysShown: true,
        thickness: 10,
        child: ListView(
          children: [
            _header(),
            AdminCard(title:'Orientações',callback:(){},asset:'lib/assets/images/card_orientation.svg'),
            AdminCard(title:'Relatórios',callback:(){},asset:'lib/assets/images/card_report.svg'),
            AdminCard(title:'Usuários',callback:(){},asset:'lib/assets/images/card_user.svg'),
            SizedBox(height:100)
          ],
        ),
      ),
    );
  }

  Column _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectableText(
                'Área restrita',
                style: AppTextStyles.titleBold,
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.0, top: 25.0, bottom: 10.0),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        ColorsModel.primaryLight),
                  ),
                  onPressed: () {
                    navKey.currentState.pushNamed(Routes.login);
                  },
                  child: Text(
                    'Voltar',
                    style: AppTextStyles.subtitle,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
