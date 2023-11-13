import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'showser_dialog_widget.dart' show ShowserDialogWidget;
import 'package:flutter/material.dart';

class ShowserDialogModel extends FlutterFlowModel<ShowserDialogWidget> {
  ///  Local state fields for this component.

  UserModelStruct? userModel;
  void updateUserModelStruct(Function(UserModelStruct) updateFn) =>
      updateFn(userModel ??= UserModelStruct());

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
