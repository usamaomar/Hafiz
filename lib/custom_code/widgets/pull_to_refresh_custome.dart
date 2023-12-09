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

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PullToRefreshCustome extends StatefulWidget {
  const PullToRefreshCustome({
    Key? key,
    this.width,
    this.height,
    this.pulledAction,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? pulledAction;

  @override
  _PullToRefreshCustomeState createState() => _PullToRefreshCustomeState();
}

class _PullToRefreshCustomeState extends State<PullToRefreshCustome> {
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () async {
        widget.pulledAction?.call();
      }, // refresh callback
      child: Container(
        height: widget.height,
        width: widget.width,
        child: ListView(children: [
          Container(
            height: 1,
            width: double.infinity,
          )
        ]),
      ), // scroll view
    );
  }
}
