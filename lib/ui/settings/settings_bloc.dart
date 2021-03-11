import 'package:appclimax/data/repository/store_repository.dart';
import 'package:appclimax/model/settings.dart';
import 'package:flutter/cupertino.dart';

class SettingsBloc extends ChangeNotifier {
  final StoreRepository storage;
  Settings currentSettings = Settings();

  SettingsBloc({@required this.storage});

  void loadSettings() async {
    var settings = await storage.loadSettings();
    currentSettings = Settings(
      isCelsius: settings.isCelsius,
      isMiles: settings.isMiles,
      isSoundActive: settings.isSoundActive,
    );
    notifyListeners();
  }

  void saveSetting({bool celsius, bool miles, bool soundActive}) async {
    currentSettings = Settings(
      isCelsius: celsius ?? currentSettings.isCelsius,
      isMiles: miles ?? currentSettings.isMiles,
      isSoundActive: soundActive ?? currentSettings.isSoundActive,
    );
    await storage.saveSettings(currentSettings);
    notifyListeners();
  }
}
