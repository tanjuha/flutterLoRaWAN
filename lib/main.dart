import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/pages/home.dart';
import 'package:flutter_lo_ra_wan/pages/initial.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.purple,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const Initial(),
      '/home': (context) => const Home()
    },
  ));
}
