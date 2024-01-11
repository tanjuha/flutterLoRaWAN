import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/models/lo_ra_wan_form_model.dart';
import 'package:provider/provider.dart';

class ManualRange extends StatefulWidget {
  const ManualRange({super.key});

  @override
  State<ManualRange> createState() => _ManualRangeState();
}

class _ManualRangeState extends State<ManualRange> {
  @override
  Widget build(BuildContext context) {
    final loRaWanFormModel = Provider.of<LoRaWANFormModel>(context, listen: true);

    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Serial: '),
        Text('${loRaWanFormModel.defaultRange}${loRaWanFormModel.formattedManualRangeValue}'),
        Align(
            alignment: Alignment.center,
            child: ElevatedButton(
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
    final formDataModel = Provider.of<LoRaWANFormModel>(context, listen: true);

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
              formDataModel.updateManualRangeValue(index, value);
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
