import 'dart:convert';

WorldCases worldCasesFromJson(String str) =>
    WorldCases.fromJson(json.decode(str));

String worldCasesToJson(WorldCases data) => json.encode(data.toJson());

class WorldCases {
  WorldCases({
    this.totalConfirmed,
    this.totalDeaths,
    this.totalRecovered,
  });

  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;

  factory WorldCases.fromJson(Map<String, dynamic> json) => WorldCases(
        totalConfirmed: json["TotalConfirmed"],
        totalDeaths: json["TotalDeaths"],
        totalRecovered: json["TotalRecovered"],
      );

  Map<String, dynamic> toJson() => {
        "TotalConfirmed": totalConfirmed,
        "TotalDeaths": totalDeaths,
        "TotalRecovered": totalRecovered,
      };
}
