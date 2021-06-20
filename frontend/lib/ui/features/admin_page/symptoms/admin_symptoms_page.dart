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
    _availableSymptoms() {
      return Column(
        children: store.sintomas
            .map((sintoma) => ListTile(
                  title: SelectableText(
                    sintoma,
                    style: AppTextStyles.subtitle,
                  ),
                  leading: Icon(
                    FeatherIcons.activity,
                    color: Colors.white,
                  ),
                ))
            .toList(),
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
                          store.addSymptom(context);
                          navKey.currentState.pop();
                        },
                        child: Text("Confirmar")),
                  ],
                )
              ],
            ),
          ));
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
                    )
                  ],
                )),
          ),
          Container(
            height: 2,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(12)),
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
