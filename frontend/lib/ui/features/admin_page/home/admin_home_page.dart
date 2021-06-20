import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/assets_model.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/utils/functions.dart';
import 'package:pandemicweb/ui/features/admin_page/home/admin_home_page.store.dart';

import 'widgets/admin_card.widget.dart';

class AdminHomePage extends StatelessWidget {
  final store = AdminHomePageStore();
  @override
  Widget build(BuildContext context) {
    _logout() {
      Functions.showGenericModal(
          context: context,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deseja fazer logout?",
                  style:
                      AppTextStyles.subtitle.copyWith(color: Colors.grey[850]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AssetsModel.card_user,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          navKey.currentState.pop();
                        },
                        child: Text("Cancelar")),
                    TextButton(
                        onPressed: () {
                          Functions.logoutUser();
                          navKey.currentState.pushNamed(Routes.login);
                        },
                        child: Text("Confirmar")),
                  ],
                )
              ],
            ),
          ));
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
                  padding:
                      EdgeInsets.only(right: 30.0, top: 25.0, bottom: 10.0),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          ColorsModel.primaryLight),
                    ),
                    onPressed: () {
                      _logout();
                      //
                    },
                    child: Text(
                      'Logout',
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
                title: 'Sintomas',
                description: 'Cadastre sintomas de covid do seu app',
                callback: () {
                  navKey.currentState.pushNamed(Routes.admin_symptoms);
                },
                asset: AssetsModel.card_orientation),
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
}
