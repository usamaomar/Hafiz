// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:numberpicker/numberpicker.dart';

class NumberScrollableWidget extends StatefulWidget {
  const NumberScrollableWidget({
    Key? key,
    this.width,
    this.height,
    required this.maxAyat,
    required this.onChangeValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int maxAyat;
  final Future<dynamic> Function() onChangeValue;

  @override
  _NumberScrollableWidgetState createState() => _NumberScrollableWidgetState();
}

class _NumberScrollableWidgetState extends State<NumberScrollableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        NumberPicker(
          value: FFAppState().timeModelAppState.calculationValue,
          minValue: 1,
          maxValue: widget.maxAyat,
          onChanged: (value) {
            FFAppState().timeModelAppState.calculationValue = value;
            widget.onChangeValue.call();
          },
        ),
      ],
    ));
  }
}
