import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_sone_page_widget.dart' show AddSonePageWidget;
import 'package:flutter/material.dart';

class AddSonePageModel extends FlutterFlowModel<AddSonePageWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AddSonePage widget.
  List<UserCollectionRecord>? firebaseListOfUseres;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in PullToRefreshCustome widget.
  List<UserCollectionRecord>? firebaseListOfUseresCopy;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
