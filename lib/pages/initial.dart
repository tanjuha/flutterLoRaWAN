import 'package:flutter/material.dart';

class Initial extends StatelessWidget {
  const Initial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoRaWAN'),
          centerTitle: true,
          backgroundColor: Colors.black38,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Add')
          )
        )
    );
  }
}
