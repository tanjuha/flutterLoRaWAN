import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/pages/channel.dart';

class DeviceAddress extends StatefulWidget {
  const DeviceAddress({super.key});

  @override
  State<DeviceAddress> createState() => _DeviceAddressState();
}

class _DeviceAddressState extends State<DeviceAddress> {
  bool sensorValue2 = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Device Address'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField( decoration: InputDecoration(label: Text('Application Key:')),),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 120.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Application Rate',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 15.0)),
              Text("Minutes")
            ],
          ),
          Row(
            children: [
              const Text('External Supply'),
              Checkbox(
                value: sensorValue2,
                onChanged: (value) {
                  setState(() {
                    sensorValue2 = value!;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
              },
              child: const Text('Send Command')
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: Column(
              children: [
                TextField(
                  enabled: false,
                  maxLines: 3,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)
                    )
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Channel'),
                              content: const Channel(),
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
                    child: const Text('Add Channel')
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                    },
                    child: const Text('Remove Channel')
                ),
              ],
            ),
          )
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