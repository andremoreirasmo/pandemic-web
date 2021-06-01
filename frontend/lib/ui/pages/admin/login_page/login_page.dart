import 'package:flutter/material.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/shared/utils/app_button.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/utils/text_form_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  _buildBody(context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/login_background.jpg"),
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
                        "Login", "Digite o e-mail de administrador")),
                Container(
                    padding: EdgeInsets.only(top: 8),
                    child: AppTextField("Senha", "Digite sua senha",
                        password: true)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        padding: EdgeInsets.only(top: 32),
                        child: AppButton("Entrar", login,
                            color: ColorsModel.primaryLight)),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void login() {
     navKey.currentState.pushNamed(Routes.admin_home);
  }
}
