import 'dart:convert';

import 'package:appclimax/data/data_constants.dart';
import 'package:appclimax/data/repository/api_repository.dart';
import 'package:appclimax/model/city.dart';
import 'package:appclimax/model/weather.dart';
import 'package:http/http.dart' as http;

class ApiImpl extends ApiRepository {
  @override
  Future<List<City>> getCities(String text) async {
    final url = '${api}search/?query=$text';
    final response = await http.get(url);
    final body = Utf8Decoder().convert(response.bodyBytes);
    final data = jsonDecode(body) as List;
    final cities = data.map((e) => City.fromJson(e)).toList();
    return cities;
  }

  @override
  Future<City> getWeathers(City city) async {
    final url = '$api${city.id}';
    final response = await http.get(url);
    final body = Utf8Decoder().convert(response.bodyBytes);
    final data = jsonDecode(body);
    final weatherData = data['consolidated_weather'] as List;
    final weathers = weatherData.map((e) => Weather.fromJson(e)).toList();
    final newCity = city.fromWeathers(weathers);
    return newCity;
  }
}
