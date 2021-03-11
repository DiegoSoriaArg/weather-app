import 'package:appclimax/data/repository/store_repository.dart';
import 'package:appclimax/model/city.dart';
import 'package:flutter/cupertino.dart';

class CitiesBloc extends ChangeNotifier {
  List<City> cities = [];
  final StoreRepository storage;

  CitiesBloc({@required this.storage});

  void loadCities() async {
    cities = await storage.getCities();
    notifyListeners();
  }

  void deleteCity(City city) async {
    await storage.deleteCity(city);
    loadCities();
  }
}
