import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Pages/search.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //initialRoute: '/location',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => SearchLocation(),
    },
  ));
}

