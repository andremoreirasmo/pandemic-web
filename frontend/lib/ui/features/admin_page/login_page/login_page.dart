import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandemicweb/shared/widgets/app_button.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/assets_model.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/widgets/text_form_field.dart';
import 'package:pandemicweb/ui/features/admin_page/login_page/login_page.store.dart';

class LoginPage extends StatelessWidget {
  final store = LoginPageStore();
  @override
  Widget build(BuildContext context) {
    _buildBody() {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsModel.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    child: SelectableText(
                      'Fazer login na área restrita',
                      style: AppTextStyles.titleBold,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 32),
                      child: AppTextField(
                        label: "Login",
                        hint: "Digite o e-mail de administrador",
                        onChanged: store.setUsername,
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 8),
                      child: AppTextField(
                          label: "Senha",
                          hint: "Digite sua senha",
                          onChanged: store.setPassword,
                          password: true)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          padding: EdgeInsets.only(top: 32),
                          child: AppButton(
                              text: "Entrar",
                              style: AppTextStyles.description
                                  .copyWith(color: Colors.black),
                              callback: store.authenticate,
                              showProgress: store.isLoading,
                              color: ColorsModel.primaryLight)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    store.onErrorMessage,
                    style:
                        AppTextStyles.subtitle.copyWith(color: Colors.red[400]),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(body: Observer(builder: (_) => _buildBody()));
  }
}
