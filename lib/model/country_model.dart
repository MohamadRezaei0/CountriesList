import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({this.countries});

  List<Country> countries;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        countries: List<Country>.from(
          json["countries"].map((x) => Country.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(
          countries.map((x) => x.toJson()),
        ),
      };
}

class Country {
  Country({
    this.id,
    this.name,
    this.countryId,
  });

  int id;
  String name;
  int countryId;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
      };
}
