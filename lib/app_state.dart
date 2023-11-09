import 'package:flutter/material.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  UserModelStruct _userModel = UserModelStruct();
  UserModelStruct get userModel => _userModel;
  set userModel(UserModelStruct value) {
    _userModel = value;
  }

  void updateUserModelStruct(Function(UserModelStruct) updateFn) {
    updateFn(_userModel);
  }

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  List<String> _listOfNames = [];
  List<String> get listOfNames => _listOfNames;
  set listOfNames(List<String> value) {
    _listOfNames = value;
  }

  void addToListOfNames(String value) {
    _listOfNames.add(value);
  }

  void removeFromListOfNames(String value) {
    _listOfNames.remove(value);
  }

  void removeAtIndexFromListOfNames(int index) {
    _listOfNames.removeAt(index);
  }

  void updateListOfNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _listOfNames[index] = updateFn(_listOfNames[index]);
  }

  void insertAtIndexInListOfNames(int index, String value) {
    _listOfNames.insert(index, value);
  }

  List<String> _listOfPhoneNumbers = [];
  List<String> get listOfPhoneNumbers => _listOfPhoneNumbers;
  set listOfPhoneNumbers(List<String> value) {
    _listOfPhoneNumbers = value;
  }

  void addToListOfPhoneNumbers(String value) {
    _listOfPhoneNumbers.add(value);
  }

  void removeFromListOfPhoneNumbers(String value) {
    _listOfPhoneNumbers.remove(value);
  }

  void removeAtIndexFromListOfPhoneNumbers(int index) {
    _listOfPhoneNumbers.removeAt(index);
  }

  void updateListOfPhoneNumbersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _listOfPhoneNumbers[index] = updateFn(_listOfPhoneNumbers[index]);
  }

  void insertAtIndexInListOfPhoneNumbers(int index, String value) {
    _listOfPhoneNumbers.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
