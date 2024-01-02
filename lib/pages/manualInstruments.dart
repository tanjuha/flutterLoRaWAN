import 'package:flutter/material.dart';

class ManualRange extends StatefulWidget {
  const ManualRange({super.key});

  @override
  State<ManualRange> createState() => _ManualRangeState();
}

class _ManualRangeState extends State<ManualRange> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Serial D0 - 14 - 11 - E0 - 00 - 00 - 00 - 00'),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Range instruction'),
                    content: const ManualInput(),
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
            );
          },
          child: const Text('Range'),
        )
      ],
    );
  }
}

class ManualInput extends StatefulWidget {
  const ManualInput({super.key});

  @override
  _ManualInputState createState() => _ManualInputState();
}

class _ManualInputState extends State<ManualInput> {
  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
            (index) => Container(
          width: 50.0,
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            maxLength: 2,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(2.0),
            ),
            onChanged: (value) {
              if (value.length == 2 && index < controllers.length - 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0 ) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
