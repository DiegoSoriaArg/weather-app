import 'package:appclimax/ui/common/header_widget.dart';
import 'package:provider/provider.dart';
import 'package:appclimax/data/repository/store_repository.dart';
import 'package:appclimax/ui/settings/settings_bloc.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SettingsBloc bloc;

  @override
  void initState() {
    bloc = SettingsBloc(
      storage: context.read<StoreRepository>(),
    );
    bloc.loadSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bloc,
      builder: (_, __) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            HeaderWidget(title: 'Configuracion'),
            ListTile(
              title: Text(
                'MEDIDA',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            ListTile(
              dense: true,
              onTap: () =>
                  bloc.saveSetting(celsius: !bloc.currentSettings.isCelsius),
              title: Text(
                'Temperatura',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    bloc.currentSettings.isCelsius ? 'Celsius' : 'Fahrenheit',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey)
                ],
              ),
            ),
            ListTile(
              dense: true,
              onTap: () =>
                  bloc.saveSetting(miles: !bloc.currentSettings.isMiles),
              title: Text(
                'Viento',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    bloc.currentSettings.isMiles ? 'mph' : 'kmh',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey)
                ],
              ),
            ),
            SwitchListTile(
              title: Text(
                'Sonido',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              value: bloc.currentSettings.isSoundActive,
              onChanged: (val) => bloc.saveSetting(soundActive: val),
            ),
            Divider(
              color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}
