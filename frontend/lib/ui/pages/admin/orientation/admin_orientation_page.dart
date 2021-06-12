import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/ui/pages/admin/orientation/widgets/orientation_card.dart';


class AdminOrientationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.primaryColorDark,
      body: _buildBody(),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label:  Text('Adicionar'),
        icon:  Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Container _buildBody() {
    return Container(
    padding: EdgeInsets.all(4),
    child: Scrollbar(
      isAlwaysShown: true,
      thickness: 10,
      child: ListView(
        children: [
          _header(),
          OrientationCard(title: 'ORientação numero 1!!!!',description: 'Teste teste teste teste teste  teste teste teste   teste teste teste   teste teste teste   teste teste teste   teste teste teste ',),
          OrientationCard(title: 'ORientação numero 1!!!!',description: 'Teste teste teste teste teste  teste teste teste   teste teste teste   teste teste teste   teste teste teste   teste teste teste ',),
          OrientationCard(title: 'ORientação numero 1!!!!',description: 'Teste teste teste teste teste  teste teste teste   teste teste teste   teste teste teste   teste teste teste   teste teste teste ',)



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
                'Orientações de covid',
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
                    navKey.currentState.pushNamed(Routes.admin_home);
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
