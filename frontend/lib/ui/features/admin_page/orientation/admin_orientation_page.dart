import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/utils/functions.dart';
import 'package:pandemicweb/shared/widgets/custom_textfield.dart';
import 'package:pandemicweb/ui/features/admin_page/orientation/admin_orientation_page.store.dart';

import 'widgets/orientation.card.widget.dart';

class AdminOrientationPage extends StatelessWidget {
    final store = AdminOrientationPageStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.primaryColorDark,
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           navKey.currentState.pushNamed(Routes.new_orientation);
        },
        label: Text('Adicionar'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
  
  
   _buildBody(context) {
    return Column(
        children: [
      _header(),
      Observer(builder: (_)  {
        return store.orientations != null ? Expanded(
                        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: store.orientations.length,
            itemBuilder: (BuildContext context, int index) {
              return  OrientationCard(
                deleteCallback: () {_deleteOrientation(context,store.orientations[index].idOri) ;} ,
              title: store.orientations[index].namOri,
               description:
                store.orientations[index].desOri,
              );
            }),
        ) :Center(child: CircularProgressIndicator());
      }),
        ],
      );
  }

   _deleteOrientation(context,id) {
      Functions.showGenericModal(
          context: context,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SelectableText(
                  "Deseja realmente excluir?",
                  style:
                      AppTextStyles.description.copyWith(color: Colors.black),
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
                          //store.deleteOrientation(id);
                          navKey.currentState.pop();
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
