// To parse this JSON data, do
//
//     final brazilCases = brazilCasesFromJson(jsonString);

import 'dart:convert';

BrazilCases brazilCasesFromJson(String str) =>
    BrazilCases.fromJson(json.decode(str));

String brazilCasesToJson(BrazilCases data) => json.encode(data.toJson());

class BrazilCases {
  BrazilCases({
    this.country,
    this.countryCode,
    this.province,
    this.city,
    this.cityCode,
    this.lat,
    this.lon,
    this.cases,
    this.status,
    this.date,
  });

  String country;
  String countryCode;
  String province;
  String city;
  String cityCode;
  String lat;
  String lon;
  int cases;
  String status;
  DateTime date;

  factory BrazilCases.fromJson(Map<String, dynamic> json) => BrazilCases(
        country: json["Country"],
        countryCode: json["CountryCode"],
        province: json["Province"],
        city: json["City"],
        cityCode: json["CityCode"],
        lat: json["Lat"],
        lon: json["Lon"],
        cases: json["Cases"],
        status: json["Status"],
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
        "CountryCode": countryCode,
        "Province": province,
        "City": city,
        "CityCode": cityCode,
        "Lat": lat,
        "Lon": lon,
        "Cases": cases,
        "Status": status,
        "Date": date.toIso8601String(),
      };
}
