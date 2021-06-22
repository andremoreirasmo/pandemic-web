import 'dart:io';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/widgets/app_button.dart';
import 'package:pandemicweb/shared/widgets/text_form_field.dart';
import 'package:pandemicweb/ui/features/admin_page/orientation/admin_orientation_page.store.dart';

class NewOrientationPage extends StatelessWidget {
  final store = AdminOrientationPageStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.primaryColorDark,
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      padding: EdgeInsets.all(4),
      child: Scrollbar(
        isAlwaysShown: true,
        thickness: 10,
        child: ListView(
          children: [_header(), _buildForm()],
        ),
      ),
    );
  }

  Center _buildForm() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(75.0),
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: <Color>[
                  ColorsModel.primaryColorDark,
                  ColorsModel.primaryBlueColorDark,
            
                  ColorsModel.primaryBlueColorLight,
                  
                  
                
                ],
              ),
              boxShadow: [
                BoxShadow(color: ColorsModel.secundaryColor, blurRadius: 5)
              ],
              borderRadius: BorderRadius.circular(16),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: SelectableText('Cadastro',
                            style: AppTextStyles.subtitle),
                      ),
                      AppTextField(
                        label: 'Título',
                        hint: 'Título da orientação',
                        textColor: ColorsModel.primaryLight,
                        onChanged: store.setTitle,
                      ),
                      AppTextField(
                        label: 'Descrição',
                        textColor: ColorsModel.primaryLight,
                        keyboardType: TextInputType.multiline,
                        onChanged: store.setDescription,
                      ),
                    ],
                  ),
                  Observer(
                    builder: (_) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              store.createResponseMessage,
                              style: AppTextStyles.subtitle
                                  .copyWith(color: Colors.amber[400]),
                            ),
                          ),
                          Container(
                              height: 50,
                              child: AppButton(
                                showProgress: store.isBtnCreateLoading,
                                text: 'Enviar',
                                callback: store.create,
                                color: ColorsModel.primaryLight,
                                style: AppTextStyles.description.copyWith(
                                    color: ColorsModel.primaryBlueColorDark),
                              )),
                        ],
                      );
                    },
                  )
                ]),
          ),
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
                'Nova Orientação de covid',
                style: AppTextStyles.description.copyWith(color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.0, top: 25.0, bottom: 10.0),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        ColorsModel.primaryLight),
                  ),
                  onPressed: () {
                    navKey.currentState.pushNamed(Routes.admin_orientation);
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
