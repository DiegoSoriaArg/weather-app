import 'package:appclimax/model/city.dart';
import 'package:appclimax/model/settings.dart';

abstract class StoreRepository {
  Future<void> saveCity(City city);
  Future<void> saveCities(List<City> cities);
  Future<List<City>> getCities();
  Future<DateTime> getLasUpdate();
  Future<void> saveLasUpdate();
  Future<void> deleteCity(City city);
  Future<Settings> loadSettings();
  Future<void> saveSettings(Settings settings);
}
