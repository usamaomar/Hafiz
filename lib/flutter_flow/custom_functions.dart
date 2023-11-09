import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

List<CenterModelStruct> combineStringLists(
  List<String> listOfNames,
  List<String> listOfPhones,
) {
  List<CenterModelStruct> listOfCenters = [];
  int index = 0;
  for (String item in listOfNames) {
    listOfCenters
        .add(CenterModelStruct(name: item, phoneNumber: listOfPhones[index]));
    index = index + 1;
  }
  return listOfCenters;
}

List<CenterModelStruct> filterCenterModelList(
  List<CenterModelStruct> originalList,
  List<CenterModelStruct> secondList,
  String searchText,
) {
  // Check if searchText is empty or null
  if (searchText == null || searchText.isEmpty) {
    return originalList;
  }

  // Filter the second list based on the search text
  return secondList.where((item) {
    return item.name.toLowerCase().contains(searchText.toLowerCase()) ||
        item.phoneNumber.contains(searchText);
  }).toList();
}
