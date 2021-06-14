import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/assets_model.dart';
import 'package:pandemicweb/shared/utils/colors.dart';

import 'widgets/admin_card.widget.dart';

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
            AdminCard(
                title: 'Orientações',
                description: 'Ver e cadastrar novas orientações',
                callback: () {
                  navKey.currentState.pushNamed(Routes.admin_orientation);
                },
                asset: AssetsModel.card_orientation),
            AdminCard(
                title: 'Relatórios',
                description:
                    'Veja relatórios de covid na utilização do seu app',
                callback: () {
                  navKey.currentState.pushNamed(Routes.admin_report);
                },
                asset: AssetsModel.card_report),
            AdminCard(
                title: 'Usuários',
                description: 'Cadastrar novos usuários no app',
                callback: () {
                  navKey.currentState.pushNamed(Routes.admin_user);
                },
                asset: AssetsModel.card_user),
            SizedBox(height: 100)
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
