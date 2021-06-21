import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/shared/utils/functions.dart';
import 'package:pandemicweb/shared/widgets/custom_textfield.dart';
import 'package:pandemicweb/shared/widgets/not_found_message.dart';
import 'package:pandemicweb/ui/features/admin_page/symptoms/admin_symptoms.store.dart';

class AdminSymptomsPage extends StatelessWidget {
  final store = AdminSymptomsStore();

  AdminSymptomsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _cardOptionsBandeija(MapEntry entry) {
      return Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              height: store.showItemOptionsOf == entry.key ? 50.0 : 0,
              // color: Colors.red,
              duration: Duration(milliseconds: 300),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          // side: BorderSide(
                          //   color: ColorsModel.secundaryColor,
                          // ),
                        ),
                        onPressed: () {
                          store.removeSymptom(entry.key);
                        },
                        padding: EdgeInsets.all(10.0),
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text("Remover"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }

    _addSymptom() {
      Functions.showGenericModal(
          context: context,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SelectableText(
                  "Cadastrar novo sintoma",
                  style:
                      AppTextStyles.description.copyWith(color: Colors.black),
                ),
                CustomTextField(
                  hintText: "Nome do sintoma",
                  onChanged: store.setCurrentSymptom,
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
                          store.addSymptom();
                          navKey.currentState.pop();
                        },
                        child: Text("Confirmar")),
                  ],
                )
              ],
            ),
          ));
    }

    _availableSymptoms() {
      return Observer(
        builder: (_) => Column(
          children: [
            ...store.sintomas
                .asMap()
                .entries
                .map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          store.toggleOptionsItem(entry.key);
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: ColorsModel.primaryBlueColorDark,
                                  borderRadius: BorderRadius.circular(12)),
                              child: IgnorePointer(
                                ignoring: true,
                                child: ListTile(
                                  title: Text(
                                    entry.value,
                                    style: AppTextStyles.subtitle,
                                  ),
                                  leading: Icon(
                                    FeatherIcons.activity,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            _cardOptionsBandeija(entry)
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
            child: SelectableText(
              'Sintomas',
              style: AppTextStyles.titleBold.copyWith(fontSize: 36),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
                onPressed: _addSymptom,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Cadastrar sintoma",
                      style: AppTextStyles.titleBold,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
          Container(
            height: 4,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12)),
          ),
          SizedBox(
            height: 100,
          ),
          Observer(
            builder: (_) => store.sintomas.isEmpty
                ? NotFoundMessage(
                    color: Colors.white,
                  )
                : _availableSymptoms(),
          ),
        ],
      ),
    );
  }
}
