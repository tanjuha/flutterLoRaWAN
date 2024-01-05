import 'package:flutter/material.dart';

class LoRaWANFormModel extends ChangeNotifier {

  String _defaultRange = 'D0 - 14 - 11 - E0 - ';

  String get defaultRange => _defaultRange;

  List<String> manualRangeValue = List.generate(4, (index) => " 00 ");

  void updateManualRangeValue(int index, String newText) {
    manualRangeValue[index] = newText;
    notifyListeners();
  }

  String get formattedManualRangeValue {
    return manualRangeValue.join(' - ').toUpperCase();
  }
}