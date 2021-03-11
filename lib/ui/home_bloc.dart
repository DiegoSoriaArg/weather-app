import 'package:appclimax/data/repository/api_repository.dart';
import 'package:appclimax/data/repository/store_repository.dart';
import 'package:appclimax/model/city.dart';
import 'package:appclimax/model/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class HomeBloc extends ChangeNotifier {
  List<City> cities = [];
  Settings settings = Settings();
  final StoreRepository storage;
  final ApiRepository apiService;
  bool loading = false;

  final formatDate = DateFormat('dd/MM/yyyy HH');

  HomeBloc({this.storage, this.apiService});

  void loadCities() async {
    final lastUpdate = await storage.getLasUpdate();
    final now = DateTime.now();
    final localCities = await storage.getCities();
    if (localCities.isEmpty) return;
    if (lastUpdate == null ||
        (formatDate.format(now) != formatDate.format(lastUpdate))) {
      List<City> citiesUpdated = [];
      loading = true;
      notifyListeners();
      for (City city in localCities) {
        final cityUpdated = await apiService.getWeathers(city);
        citiesUpdated.add(cityUpdated);
      }
      await storage.saveCities(citiesUpdated);
      await storage.saveLasUpdate();
      cities = citiesUpdated;
      loading = false;
    } else {
      cities = await storage.getCities();
    }
    await loadSettings();
  }

  Future<void> loadSettings() async {
    settings = await storage.loadSettings();
    notifyListeners();
  }
}
