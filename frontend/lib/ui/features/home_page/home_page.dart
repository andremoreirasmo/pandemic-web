import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pandemicweb/core/models/orientation.model.dart' as Ori; 
import 'package:pandemicweb/shared/widgets/app_button.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/assets_model.dart';
import 'package:pandemicweb/ui/features/admin_page/orientation/admin_orientation_page.store.dart';
import 'package:pandemicweb/ui/features/home_page/widgets/how_to_get_covid_card.widget.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final store = AdminOrientationPageStore();
    Size size = MediaQuery.of(context).size;
    _buildTop() {
      return Container(
        height: 400,
        width: size.width * 0.8,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  "Os doutores dizem",
                  style: AppTextStyles.titleBold
                      .copyWith(color: Color(0xFF624897), fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText(
                  "Fique em casa e\nsalve o mundo",
                  style: AppTextStyles.subtitle
                      .copyWith(color: Color(0xFFb7b6bd), fontSize: 26),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: SelectableText(
                    "O distanciamento social é uma medida comportamental importantíssima neste momento, não só para a proteção individual, mas para diminuir a velocidade da propagação do vírus. Se você puder trabalhar de casa e/ou sair pouco ou nada de casa, faça isso! Caso necessário, procure frequentar farmácias, supermercados ou qualquer outro comércio em horários alternativos.",
                    style: AppTextStyles.description.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                  text: "COMEÇAR",
                  color: Color(0xFF664b9d),
                  callback: () {},
                ),
              ],
            ),
            Container(
              width: size.width*0.25,
              height: size.height*0.35,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: SvgPicture.asset(
                    AssetsModel.doctor,
                    fit: BoxFit.fill,
                    
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    _buildMiddle() {
      return Container(
        width: size.width*0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SelectableText(
                'Estimativa de vacina no brasil',
                style: AppTextStyles.subtitle
                    .copyWith(color: Color(0xFFb7b6bd), fontSize: 26),
              ),
            ]),
            SizedBox(height: 32),
            Container(
              width: size.width * 0.6,
              child: SelectableText(
                'Cálculos feitos pela Secretaria da Saúde a partir de projeções do envio de remessas de vacinas contra a Covid-19 anunciadas pelo Ministério da Saúde indicam que será possível, até setembro, imunizar todos os integrantes dos grupos de maior vulnerabilidade e dos trabalhadores da educação e ainda vacinar, com a primeira dose, até o público dos 18 anos. Até dezembro, a previsão é completar, com a segunda dose (D2), o esquema vacinal de todos os imunizados.',
                style: AppTextStyles.description.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              width: size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Image.asset(
                      AssetsModel.virus,
                      width: size.width * 0.15,
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 16.0, left: 105),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SelectableText(
                                'Variantes do vírus',
                                style: AppTextStyles.subtitle.copyWith(
                                    color: Color(0xFFb7b6bd), fontSize: 26),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width*0.4,
                          child: SelectableText(
                              "O distanciamento social é uma medida comportamental importantíssima neste momento, não só para a proteção individual, mas para diminuir a velocidade da propagação do vírus. Se você puder trabalhar de casa e/ou sair pouco ou nada de casa, faça isso! Caso necessário, procure frequentar farmácias, supermercados ou qualquer outro comércio em horários alternativos.",
                              style: AppTextStyles.description.copyWith(
                                color: Colors.grey[600],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    _buildHowToGetCards() {
      return Column(
        
        children: [
          SizedBox(height: 100),
           SelectableText(
                'Como o vírus é contraído',
                style: AppTextStyles.subtitle
                    .copyWith(color: Color(0xFFb7b6bd), fontSize: 26),
              ),
              SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HowToGetCovidCard(
                  title: 'Via contato com o infectado',
                  description: 'A maioria das pessoas com covid 19 vão experenciar dificuldade respiratória e após isso irão se recuperar',
                  asset: AssetsModel.virus,
                ),
                HowToGetCovidCard(
                  title: 'Via contato com o infectado',
                  description: 'A maioria das pessoas com covid 19 vão experenciar dificuldade respiratória e após isso irão se recuperar',
                  asset: AssetsModel.virus,
                ),
          ],),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HowToGetCovidCard(
                  title: 'Via contato com o infectado',
                  description: 'A maioria das pessoas com covid 19 vão experenciar dificuldade respiratória e após isso irão se recuperar',
                  asset: AssetsModel.virus,
                ),
                HowToGetCovidCard(
                  title: 'Via contato com o infectado',
                  description: 'A maioria das pessoas com covid 19 vão experenciar dificuldade respiratória e após isso irão se recuperar',
                  asset: AssetsModel.virus,
                ),
          ],),
        ],
      );
    }

    _buildOrientations() {
     return Observer(
       builder: (_) {
         return Column (
        children: [
          SizedBox(height:100),
          SelectableText(
                'Orientações',
                style: AppTextStyles.subtitle
                    .copyWith(color: Color(0xFFb7b6bd), fontSize: 26),
              ),
            store.orientations!=null?store.orientations.map((orientation){
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(children: [
                  
                ],),
              );
            }).toList() :CircularProgressIndicator(),
        ],
      );
       }
     );
      
     }


     return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 80),
      child: ListView(
        children: [
          _buildTop(),
          _buildMiddle(),
          _buildHowToGetCards(),
          _buildOrientations()
        ],
      ),
    );
  }
}
