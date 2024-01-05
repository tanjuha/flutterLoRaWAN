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


  // Device Address
  late TextEditingController applicationKeyController;
  late TextEditingController applicationRateController;
  late TextEditingController deviceAddressController;
  late TextEditingController networkKeyController;


  LoRaWANFormModel({
    String applicationKeyInitialValue = '',
    String applicationRateInitialValue = '15',
    String deviceAddressInitialValue = '',
    String networkKeyInitialValue = '',
}) {
    applicationKeyController = TextEditingController(text: applicationKeyInitialValue);
    applicationRateController = TextEditingController(text: applicationRateInitialValue);
    deviceAddressController = TextEditingController(text: deviceAddressInitialValue);
    networkKeyController = TextEditingController(text: networkKeyInitialValue);
  }

  void updateValueApplicationKey(String newValue) {
    applicationKeyController.text = newValue;
    notifyListeners();
  }

  void updateValueApplicationRate(String newValue) {
    applicationRateController.text = newValue;
    notifyListeners();
  }

  void updateValueDeviceAddress(String newValue) {
    deviceAddressController.text = newValue;
    notifyListeners();
  }

  void updateValueNetworkKey(String newValue) {
    networkKeyController.text = newValue;
    notifyListeners();
  }

  void updateSelectedItem(Item newItem) {
    _selectedItem = newItem;
    String option = newItem.option;

    switch (option) {
      case 'option_temperature':
        updateValueDeviceAddress("temperature: 31312");
        updateValueNetworkKey("temperature: 00000");
        _isSelectedChannel = true;
        break;
      case 'option_humidity':
        updateValueDeviceAddress("humidity: 3456");
        updateValueNetworkKey("humidity: 11111");
        _isSelectedChannel = true;
        break;
      case 'option_differential_pressure':
        updateValueDeviceAddress("differential pressure: 2345");
        updateValueNetworkKey("differential pressure: 22222");
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
