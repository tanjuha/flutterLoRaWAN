import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/pages/initial.dart';
import 'package:flutter_lo_ra_wan/pages/sensors.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.purple,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const Initial(),
      '/sensors': (context) => const Sensors()
    },
  ));
}
