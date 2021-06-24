import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/widgets/custom_textfield.dart';
import 'package:pandemicweb/ui/features/covid_test_page/covid_test_page.store.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:smart_select/smart_select.dart';

class CovidTestPage extends StatelessWidget {
  final store = CovidTestPageStore();
  CovidTestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    _customLabeledTextField({child, label}) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsModel.primaryBlueColorDark),
            ),
            child
          ],
        ),
      );
    }

    _symptomsList() {
      return Observer(
          builder: (_) => store.sintomas.isEmpty
              ? SkeletonAnimation(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 50,
                    width: (300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                  ),
                )
              : Container(
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // color: Colors.grey[300]
                      border: Border.all(color: Colors.grey[300])),
                  child: SmartSelect.multiple(
                    value: [],
                    title: "Sintomas",
                    tileBuilder: (context, state) {
                      return S2Tile.fromState(
                        state,
                        isTwoLine: true,
                        leading: Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: const Icon(FeatherIcons.activity),
                        ),
                      );
                    },

                    modalType: S2ModalType.popupDialog,
                    placeholder: "Selecione",
                    choiceType: S2ChoiceType.chips,
                    // value: 0,
                    modalStyle: S2ModalStyle(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onChange: (v) {
                      store.setSymptomsSelected(v.value);
                    },
                    choiceItems: store.sintomas,
                  ),
                ));
    }

    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: SelectableText("Cadastro",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    height: 4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: _customLabeledTextField(
                            label: "Nome",
                            child: CustomTextField(
                              hintText: "João",
                            )),
                      ),
                      Flexible(
                        child: _customLabeledTextField(
                            label: "Sobrenome",
                            child: CustomTextField(
                              hintText: "Da Silva",
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: _customLabeledTextField(
                            label: "Email",
                            child: CustomTextField(
                              hintText: "exemplo@gmail.com",
                            )),
                      ),
                      Flexible(
                        child: _customLabeledTextField(
                            label: "Selecione o gênero",
                            child: Row(
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: 0,
                                  onChanged: (v) {},
                                ),
                                Text(
                                  "Masculino",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]),
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: 0,
                                  onChanged: (v) {},
                                ),
                                Text(
                                  "Feminino",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: _customLabeledTextField(
                            label: "Senha",
                            child: CustomTextField(
                              hintText: "********",
                            )),
                      ),
                      Flexible(
                        child: _customLabeledTextField(
                            label: "CPF",
                            child: CustomTextField(
                              hintText: "000.000.000-00",
                            )),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText("Seus sintomas",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _symptomsList(),
                      SizedBox(
                        width: 80,
                      ),
                      Observer(
                        builder: (_) => Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            store.diagnostico,
                            style: AppTextStyles.titleBold.copyWith(
                                color: store.textColorDiagnostico,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    height: 4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(6),
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.indigo),
                          child: FlatButton(
                            child: Text(
                              "CADASTRAR",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
