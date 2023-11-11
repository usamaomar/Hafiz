// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<dynamic>?> getTeachersForCenter(String centerReference) async {
  List<dynamic> teachersList = [];

  // Initialize Firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Create a reference to the "connectTeacherToCenter" collection
    CollectionReference connectTeacherToCenterCollection =
        firestore.collection("connectTeacherToCenter");

    // Create a query to filter documents based on the center_reference
    QuerySnapshot querySnapshot = await connectTeacherToCenterCollection
        .where("center_reference", isEqualTo: centerReference)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      // Get the teacher_reference from each document
      String teacherReference = doc.get("teacher_reference");

      // Create a reference to the "teacherCollection"
      CollectionReference teacherCollection =
          firestore.collection("teacherCollection");

      // Fetch the teacher's data using the teacher_reference
      DocumentSnapshot teacherSnapshot =
          await teacherCollection.doc(teacherReference).get();

      if (teacherSnapshot.exists) {
        Map<String, dynamic> teacherData =
            teacherSnapshot.data() as Map<String, dynamic>;
        teachersList.add(teacherData);
      }
    }

    return teachersList;
  } catch (e) {
    print("Error retrieving data: $e");
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
