import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter_lo_ra_wan/models/LoRaWANFormModel.dart';

class Item {
  final int id;
  final String name;
  final String option;

  Item({required this.id, required this.name, required this.option});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      option: json['option'],
    );
  }
}

class Channel extends StatefulWidget {
  const Channel({super.key});

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {

  Future<List<Item>> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/data/channel.json');
    List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((item) => Item.fromJson(item)).toList();
  }

  List<Item> items = [];
  late Item selectedValue = Item(id: 0, name: '', option: '');

  @override
  void initState() {
    super.initState();
    loadJsonData().then((loadedItems) {
      setState(() {
        items = loadedItems;
        selectedValue = items.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final loRaWANFormModel = Provider.of<LoRaWANFormModel>(context, listen: true);

    return DropdownButton<Item>(
      value: selectedValue,
      isExpanded: true,
      menuMaxHeight: 120.0,
      hint: const Text('Select Channel'),
      onChanged: (newValue) {
        if (items.contains(newValue)) {
          loRaWANFormModel.updateSelectedItem(newValue!);

          setState(() {
            selectedValue = newValue;
          });
        }
      },
      items: items.map<DropdownMenuItem<Item>>((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item.name),
        );
      }).toList(),

    );
  }
}
