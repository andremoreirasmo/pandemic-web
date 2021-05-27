import 'package:flutter/material.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/utils/text_form_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: _buildBody(context)),
    );
  }

   _buildBody(context) { 
     return Container(
       width: MediaQuery.of(context).size.width * 0.35,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

         Container(
           padding: EdgeInsets.only(top:16),
           child: SelectableText(
                        'Fazer login na área restrita',
                        style: AppTextStyles.titleBold,
                      ),
         ),

        Container(
          padding: EdgeInsets.only(top:32),
          child: AppTextField("Login", "Digite o e-mail de administrador")),
        
        Container(
          padding: EdgeInsets.only(top:8),
          child: AppTextField("Senha", "Digite sua senha",password: true,))

       ],),
     );
   }
    
}
