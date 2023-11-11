import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admins_page_widget.dart' show AdminsPageWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class AdminsPageModel extends FlutterFlowModel<AdminsPageWidget> {
  ///  Local state fields for this page.

  List<UserModelStruct> userLocalStateList = [];
  void addToUserLocalStateList(UserModelStruct item) =>
      userLocalStateList.add(item);
  void removeFromUserLocalStateList(UserModelStruct item) =>
      userLocalStateList.remove(item);
  void removeAtIndexFromUserLocalStateList(int index) =>
      userLocalStateList.removeAt(index);
  void insertAtIndexInUserLocalStateList(int index, UserModelStruct item) =>
      userLocalStateList.insert(index, item);
  void updateUserLocalStateListAtIndex(
          int index, Function(UserModelStruct) updateFn) =>
      userLocalStateList[index] = updateFn(userLocalStateList[index]);

  DocumentReference? userRefrence;

  DocumentReference? centerRefrence;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AdminsPage widget.
  List<UserCollectionRecord>? firebaseListOfUseres;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  CenterCollectionRecord? centerDocument;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  UserCollectionRecord? userDocument;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  ConnectTeacherToCenterRecord? refres;

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
