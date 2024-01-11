import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/pages/list_instruments.dart';
import 'package:flutter_lo_ra_wan/pages/sensors.dart';

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
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('LoRa'),
                      content: const ListInstruments(),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel')
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const Sensors();
                                      }
                                  );
                                },
                                child: const Text('Ok')
                            ),
                          ],
                        )
                      ],
                    );
                  }
              );
            },
            child: const Text('Add'),
          ),
        ),
    );
  }
}
