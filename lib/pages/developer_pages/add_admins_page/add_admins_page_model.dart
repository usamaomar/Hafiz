import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_admins_page_widget.dart' show AddAdminsPageWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class AddAdminsPageModel extends FlutterFlowModel<AddAdminsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AddAdminsPage widget.
  List<UserCollectionRecord>? firebaseListOfUseres;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
