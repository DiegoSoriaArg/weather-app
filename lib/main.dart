import 'package:appclimax/data/repository/api_impl.dart';
import 'package:appclimax/data/repository/api_repository.dart';
import 'package:appclimax/data/repository/store_impl.dart';
import 'package:appclimax/data/repository/store_repository.dart';
import 'package:appclimax/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiRepository>(
          create: (_) => ApiImpl(),
        ),
        Provider<StoreRepository>(
          create: (_) => StoreImpl(),
        ),
      ],
      child: MaterialApp(
        title: 'WeatherApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: HomePage(),
      ),
    );
  }
}
