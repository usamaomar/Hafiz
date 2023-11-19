import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_hifz_component_dialog_widget.dart'
    show AddHifzComponentDialogWidget;
import 'package:flutter/material.dart';

class AddHifzComponentDialogModel
    extends FlutterFlowModel<AddHifzComponentDialogWidget> {
  ///  Local state fields for this component.

  SavedSuraModelStruct? savedSuraModel;
  void updateSavedSuraModelStruct(Function(SavedSuraModelStruct) updateFn) =>
      updateFn(savedSuraModel ??= SavedSuraModelStruct());

  dynamic soneJsonModel;

  UserModelStruct? soneUserModel;
  void updateSoneUserModelStruct(Function(UserModelStruct) updateFn) =>
      updateFn(soneUserModel ??= UserModelStruct());

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in AddHifzComponentDialog widget.
  UserCollectionRecord? soneFireBaseModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UserCollectionRecord? sonFirebaseObject;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
