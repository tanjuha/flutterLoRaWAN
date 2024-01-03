import 'package:flutter/material.dart';

class Sensors extends StatefulWidget {
  const Sensors({super.key});

  @override
  State<Sensors> createState() => _SensorsState();
}

class _SensorsState extends State<Sensors> {

  bool sensorValue1 = true;
  bool sensorValue2 = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select which sensor'),
      content: Row(
        children: [
         Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Row(
               children: [
                 const Text('#1'),
                 Checkbox(
                   value: sensorValue1,
                   onChanged: (value) {
                     setState(() {
                       sensorValue1 = value!;
                     });
                   },
                 ),
               ],
             ),
             Row(
               children: [
                 const Text('#2'),
                 Checkbox(
                   value: sensorValue2,
                   onChanged: (value) {
                     setState(() {
                       sensorValue2 = value!;
                     });
                   },
                 ),
               ],
             )
           ],
         ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/images/instrument.png'),
                fit: BoxFit.contain,
                height: 125.0,
              ),
            ],
          ),
        ],
      ),
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
                },
                child: const Text('Ok')
            ),
          ],
        )
      ],
    );
  }
}
