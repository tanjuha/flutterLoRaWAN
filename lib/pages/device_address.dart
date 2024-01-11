import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/models/form_validators.dart';
import 'package:flutter_lo_ra_wan/pages/channel.dart';
import 'package:flutter_lo_ra_wan/pages/channel_properties.dart';
import 'package:provider/provider.dart';
import 'package:flutter_lo_ra_wan/models/lo_ra_wan_form_model.dart';

class DeviceAddress extends StatefulWidget {
  const DeviceAddress({super.key});

  @override
  State<DeviceAddress> createState() => _DeviceAddressState();
}

class _DeviceAddressState extends State<DeviceAddress> {
  bool sensorValue2 = false;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final loRaWANFormModel = Provider.of<LoRaWANFormModel>(context, listen: true);

    return Form(
      key: _formKey,
      child:  AlertDialog(
        title: const Text('Device Address'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: loRaWANFormModel.isSelectedChannel,
                child: Consumer<LoRaWANFormModel>(
                  builder: (context, model, _) {
                    return TextFormField(
                      controller: model.deviceAddressController,
                      decoration: InputDecoration(labelText: 'Device Address:'),
                      validator: (value) {
                        return FormValidators.required(value!)
                            ?? FormValidators.minLength(value, 2)
                            ?? FormValidators.maxLength(value, 50)
                            ?? FormValidators.noSymbols(value);
                      },
                      onChanged: (newValue) {
                        model.updateValueDeviceAddress(newValue);
                      },
                    );
                  },
                ),
              ),
              Consumer<LoRaWANFormModel>(
                builder: (context, model, _) {
                  return TextFormField(
                    controller: model.applicationKeyController,
                    decoration: InputDecoration(labelText: 'Application Key:'),
                    validator: (value) {
                      return FormValidators.required(value!)
                          ?? FormValidators.minLength(value, 2)
                          ?? FormValidators.maxLength(value, 50)
                          ?? FormValidators.noSymbols(value);
                    },
                    onChanged: (newValue) {
                      model.updateValueApplicationKey(newValue);
                    },
                  );
                },
              ),
              Visibility(
                visible: loRaWANFormModel.isSelectedChannel,
                child: Consumer<LoRaWANFormModel>(
                  builder: (context, model, _) {
                    return TextFormField(
                      controller: model.networkKeyController,
                      decoration: InputDecoration(labelText: 'Network Key:'),
                      validator: (value) {
                        return FormValidators.required(value!)
                            ?? FormValidators.minLength(value, 2)
                            ?? FormValidators.maxLength(value, 50)
                            ?? FormValidators.noSymbols(value);
                      },
                      onChanged: (newValue) {
                        model.updateValueNetworkKey(newValue);
                      },
                    );
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 120.0,
                      child: Consumer<LoRaWANFormModel>(
                        builder: (context, model, _) {
                          return TextFormField(
                            controller: model.applicationRateController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Application Rate:'),
                            validator: (value) {
                              return FormValidators.required(value!)
                                  ?? FormValidators.maxLength(value, 3)
                                  ?? FormValidators.noSymbols(value)
                                  ?? FormValidators.onlyNumbers(value);

                            },
                            onChanged: (newValue) {
                              model.updateValueApplicationRate(newValue);
                            },
                          );
                        },
                      )
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
                        visible: loRaWANFormModel.isSelectedChannel,
                        child: ChannelProperties()
                    ),
                    Visibility(
                      visible: !loRaWANFormModel.isSelectedChannel,
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
                            style: !loRaWANFormModel.isSelectedChannel
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
                              loRaWANFormModel.isSelectedChannel ? null :
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Channel'),
                                      content: Channel(),
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

                            child: const Text('Add')
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),

                            onPressed: () {
                              loRaWANFormModel.removeSelectedChannel();
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Ok')
              ),
            ],
          )
        ],
      ),
    );
  }
}