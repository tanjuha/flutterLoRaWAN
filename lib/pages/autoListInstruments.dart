import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
    );
  }
}

class AutoListInstruments extends StatefulWidget {
  const AutoListInstruments({super.key});

  @override
  State<AutoListInstruments> createState() => _AutoListInstrumentsState();
}

class _AutoListInstrumentsState extends State<AutoListInstruments> {

  Future<List<Item>> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/list.json');
    List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((item) => Item.fromJson(item)).toList();
  }

  List<Item> items = [];
  Item? selectedValue;

  @override
  void initState() {
    super.initState();
    loadJsonData().then((loadedItems) {
      setState(() {
        items = loadedItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Item>(
      value: selectedValue,
      isExpanded: true,
        menuMaxHeight: 120.0,
        hint: const Text('Select item'),
        onChanged: ( newValue) {
          setState(() {
            selectedValue = newValue;
          });
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
