import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/models/lo_ra_wan_form_model.dart';
import 'package:flutter_lo_ra_wan/pages/initial.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<LoRaWANFormModel>(create: (_) => LoRaWANFormModel(),
      ),
    ],
       child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoRaWAN',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Initial()
      },
    );
  }
}
