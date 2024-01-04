import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/pages/channel.dart';
import 'package:flutter_lo_ra_wan/pages/channelProperties.dart';

class DeviceAddress extends StatefulWidget {
  const DeviceAddress({super.key});

  @override
  State<DeviceAddress> createState() => _DeviceAddressState();
}

class _DeviceAddressState extends State<DeviceAddress> {
  bool sensorValue2 = false;
  bool isChannel = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Device Address'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: isChannel,
                child: const TextField( decoration: InputDecoration(label: Text('Device Address:')),),
              ),
              const TextField( decoration: InputDecoration(label: Text('Application Key:')),),
              Visibility(
                visible: isChannel,
                child: const TextField( decoration: InputDecoration(label: Text('Network Key:')),),
              ),
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
                    Visibility(
                        visible: isChannel,
                        child: ChannelProperties()
                    ),
                    Visibility(
                      visible: !isChannel,
                      child: TextField(
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: !isChannel
                                ? ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),)
                                : ElevatedButton.styleFrom(
                              primary: Colors.white54,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              isChannel ? null :
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

                              setState(() {
                                isChannel = true;
                              });
                            },

                            child: const Text('Add')
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),

                            onPressed: () {
                              setState(() {
                                isChannel = false;
                              });
                            },
                            child: const Text('Remove')
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
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