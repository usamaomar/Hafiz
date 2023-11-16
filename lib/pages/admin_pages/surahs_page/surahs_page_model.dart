import '/flutter_flow/flutter_flow_util.dart';
import 'surahs_page_widget.dart' show SurahsPageWidget;
import 'package:flutter/material.dart';

class SurahsPageModel extends FlutterFlowModel<SurahsPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> listOfSuras = [];
  void addToListOfSuras(dynamic item) => listOfSuras.add(item);
  void removeFromListOfSuras(dynamic item) => listOfSuras.remove(item);
  void removeAtIndexFromListOfSuras(int index) => listOfSuras.removeAt(index);
  void insertAtIndexInListOfSuras(int index, dynamic item) =>
      listOfSuras.insert(index, item);
  void updateListOfSurasAtIndex(int index, Function(dynamic) updateFn) =>
      listOfSuras[index] = updateFn(listOfSuras[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

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
