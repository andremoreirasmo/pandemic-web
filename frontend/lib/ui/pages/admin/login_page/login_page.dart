import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:pandemicweb/repositories/login_repository.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/services/authentication.dart';
import 'package:pandemicweb/shared/utils/app_button.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/utils/text_form_field.dart';
import 'package:pandemicweb/ui/pages/admin/login_page/login_page.store.dart';

class LoginPage extends StatelessWidget {
  AuthService _authService = AuthService.instance;
  final store = LoginPageStore();
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
                        label:"Login", hint:"Digite o e-mail de administrador",onChanged: store.setUsername,)),
                Container(
                    padding: EdgeInsets.only(top: 8),
                    child: AppTextField(label:"Senha", hint:"Digite sua senha",onChanged: store.setPassword,
                        password: true)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        padding: EdgeInsets.only(top: 32),
                        child: AppButton(text: "Entrar", callback : store.authenticate,
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

 
 
}
