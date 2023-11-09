import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'developer_home_page_widget.dart' show DeveloperHomePageWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DeveloperHomePageModel extends FlutterFlowModel<DeveloperHomePageWidget> {
  ///  Local state fields for this page.

  List<CenterModelStruct> localCenterList = [];
  void addToLocalCenterList(CenterModelStruct item) =>
      localCenterList.add(item);
  void removeFromLocalCenterList(CenterModelStruct item) =>
      localCenterList.remove(item);
  void removeAtIndexFromLocalCenterList(int index) =>
      localCenterList.removeAt(index);
  void insertAtIndexInLocalCenterList(int index, CenterModelStruct item) =>
      localCenterList.insert(index, item);
  void updateLocalCenterListAtIndex(
          int index, Function(CenterModelStruct) updateFn) =>
      localCenterList[index] = updateFn(localCenterList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in DeveloperHomePage widget.
  List<CenterCollectionRecord>? listOfFirebaseCenters;
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
