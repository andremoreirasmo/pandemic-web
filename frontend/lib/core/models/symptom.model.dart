// To parse this JSON data, do
//
//     final symptomModel = symptomModelFromJson(jsonString);

import 'dart:convert';

List<SymptomModel> symptomModelFromJson(String str) => List<SymptomModel>.from(
    json.decode(str).map((x) => SymptomModel.fromJson(x)));

String symptomModelToJson(List<SymptomModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SymptomModel {
  SymptomModel({
    this.idSym,
    this.desSym,
  });

  String idSym;
  String desSym;

  factory SymptomModel.fromJson(Map<String, dynamic> json) => SymptomModel(
        idSym: json["id_sym"],
        desSym: json["des_sym"],
      );

  Map<String, dynamic> toJson() => {
        "id_sym": idSym,
        "des_sym": desSym,
      };
}
