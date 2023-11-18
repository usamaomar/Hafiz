import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
