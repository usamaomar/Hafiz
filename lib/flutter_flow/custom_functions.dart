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

List<UserModelStruct> convertFromFirebaseToUserList(
    List<UserCollectionRecord> listOfUsersFromFireBase) {
  List<UserModelStruct> listOfUsers = [];
  for (UserCollectionRecord item in listOfUsersFromFireBase) {
    listOfUsers.add(UserModelStruct(
        displayName: item.displayName,
        password: item.password,
        phoneNumber: item.phoneNumber,
        userType: item.userType));
  }
  return listOfUsers;
}

List<UserModelStruct> filterUserModelList(
  List<UserModelStruct> originalList,
  List<UserModelStruct> secondList,
  String searchText,
) {
  if (searchText == null || searchText.isEmpty) {
    return originalList;
  }
  return secondList.where((item) {
    return item.displayName.toLowerCase().contains(searchText.toLowerCase()) ||
        item.phoneNumber.contains(searchText);
  }).toList();
}

String getUserTypeName(
  String currentLanguge,
  int type,
) {
  if (currentLanguge == "ar") {
    return type == 0 ? "مبرمج" : (type == 1 ? "استاذ" : "ولي امر");
  } else {
    return type == 0 ? "Dev" : (type == 1 ? "Teacher" : "Parent");
  }
}

int getDropType(String name) {
  if (name == "Dev" || name == "مبرمج") {
    return 0;
  } else {
    return 1;
  }
}

List<UserModelStruct> convertFromFireBaseToUserAndAddToList(
  List<UserModelStruct> userAppStateList,
  UserModelStruct userModelStruct,
) {
  userAppStateList.add(userModelStruct);
  return userAppStateList;
}
