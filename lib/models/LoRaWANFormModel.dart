import 'package:flutter/material.dart';
import 'package:flutter_lo_ra_wan/pages/channel.dart';

class LoRaWANFormModel extends ChangeNotifier {

  // Range
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

  // Select Channel
  Item? _selectedItem;
  bool _isSelectedChannel = false;
  String _selectedData = '';

  Item? get selectedItem => _selectedItem;
  bool get isSelectedChannel => _isSelectedChannel;
  String get selectedData => _selectedData;

  void updateSelectedItem(Item newItem) {
    _selectedItem = newItem;
    String option = newItem.option;

    switch (option) {
      case 'option_temperature':
        _selectedData = 'option_temperature';
        _isSelectedChannel = true;
        break;
      case 'option_humidity':
        _selectedData = 'option_humidity';
        _isSelectedChannel = true;
        break;
      case 'option_differential_pressure':
        _selectedData = 'option_differential_pressure';
        _isSelectedChannel = true;
        break;
      default:
        _selectedData = '';
    }

    notifyListeners();
  }

  void removeSelectedChannel() {
    _isSelectedChannel = false;
    notifyListeners();
  }

}