import 'dart:convert';
import 'package:http/http.dart' as http;

class Countrie implements Comparable<Countrie>{
  String common;
  String official;
  String? capital;
  String region;
  String subregion;
  int population;
  String continent;
  String flag;

  Countrie(
      this.common,
      this.official,
      this.capital,
      this.region,
      this.subregion,
      this.population,
      this.continent,
      this.flag);


  static Future<List<Countrie>> fetchCountriesByRegion(String region) async {
    var url = Uri.parse('https://restcountries.com/v3.1/region/$region');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body).toList();
      return jsonResponse.map((countrie) =>Countrie.fromJson(countrie)).toList();
    } else {
      throw Exception("An error occured");
    }
  }
  //renvoi la liste des pays
  static Future<List<Countrie>> fetchCountries() async {
    var url = Uri.parse('https://restcountries.com/v3.1/all');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body).toList();
      return jsonResponse.map((countrie) =>Countrie.fromJson(countrie)).toList();
    } else {
      throw Exception("An error occured");
    }
  }
  /// recherher les pays par nom
  static Future<List<Countrie>> fetchCountriesByName(String countrieName) async {
    var url = Uri.parse('https://restcountries.com/v3.1/name/$countrieName');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body).toList();
      return jsonResponse.map((countrie) =>Countrie.fromJson(countrie)).toList();
    } else {
      throw Exception("An error occured");
    }
  }
  Map<String, dynamic> toJson() {
    return {
      "common": common,
      "official": official,
      "capital": capital,
      "region": region,
      "subregion": subregion,
      //"languages": language,
      "population": population,
      "continent":continent,
      "flag":flag,
    };
  }

  factory Countrie.fromJson(Map<String, dynamic> json) {
    return Countrie(
      json["name"]["common"]??"",
      json["name"]["official"]??"",
      "ouga",
      json["region"]??"",
      json["subregion"]??"",
      //json['languages']??"",
      json["population"],
      json["continents"][0],
      json["flags"]["png"],
    );
  }
  @override
  int compareTo(Countrie other) {
    return common.compareTo(other.common);
  }

}