import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'admins_page_model.dart';
export 'admins_page_model.dart';

class AdminsPageWidget extends StatefulWidget {
  const AdminsPageWidget({
    super.key,
    required this.centerModel,
    this.centerDocument,
  });

  final dynamic centerModel;
  final CenterCollectionRecord? centerDocument;

  @override
  _AdminsPageWidgetState createState() => _AdminsPageWidgetState();
}

class _AdminsPageWidgetState extends State<AdminsPageWidget> {
  late AdminsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firebaseListOfUseres = await queryUserCollectionRecordOnce(
        queryBuilder: (userCollectionRecord) => userCollectionRecord.where(
          'user_type',
          isEqualTo: 1,
        ),
      );
      setState(() {
        FFAppState().usereAppStateList = functions
            .convertFromFirebaseToUserList(
                _model.firebaseListOfUseres!.toList())
            .toList()
            .cast<UserModelStruct>();
      });
      setState(() {
        _model.userLocalStateList =
            FFAppState().usereAppStateList.toList().cast<UserModelStruct>();
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController?.text = FFLocalizations.of(context).getText(
            '2ixnse8s' /*  */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.chevron_left_rounded,
                          color: Color(0xFF363636),
                          size: 24.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 400),
                          () async {
                            setState(() {
                              _model.userLocalStateList = functions
                                  .filterUserModelList(
                                      FFAppState().usereAppStateList.toList(),
                                      _model.userLocalStateList.toList(),
                                      _model.textController.text)
                                  .toList()
                                  .cast<UserModelStruct>();
                            });
                          },
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            '2i8cmryd' /* Search */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.w500,
                            ),
                        keyboardType: TextInputType.emailAddress,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final dataTableList =
                          _model.userLocalStateList.map((e) => e).toList();
                      return DataTable2(
                        columns: [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'o80g1lva' /* Name */,
                                ),
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'esln3ehn' /* Phone Number */,
                                ),
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '0couzkft' /*     */,
                                ),
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                          ),
                        ],
                        rows: dataTableList
                            .mapIndexed((dataTableListIndex,
                                    dataTableListItem) =>
                                [
                                  Text(
                                    dataTableListItem.displayName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    dataTableListItem.phoneNumber,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.centerRefrence =
                                            _model.centerRefrence;
                                      });
                                      setState(() {
                                        _model.userRefrence = _model
                                            .useresDocumnetsList[
                                                dataTableListIndex]
                                            .reference;
                                      });

                                      var connectTeacherToCenterRecordReference =
                                          ConnectTeacherToCenterRecord
                                              .collection
                                              .doc();
                                      await connectTeacherToCenterRecordReference
                                          .set(
                                              createConnectTeacherToCenterRecordData(
                                        teacherReference: _model.userRefrence,
                                        centerRefrence: _model.centerRefrence,
                                      ));
                                      _model.refres = ConnectTeacherToCenterRecord
                                          .getDocumentFromData(
                                              createConnectTeacherToCenterRecordData(
                                                teacherReference:
                                                    _model.userRefrence,
                                                centerRefrence:
                                                    _model.centerRefrence,
                                              ),
                                              connectTeacherToCenterRecordReference);
                                      Navigator.pop(context);

                                      setState(() {});
                                    },
                                    child: Text(
                                      '${FFLocalizations.of(context).getVariableText(
                                        enText: 'Add to ',
                                        arText: 'اضافه ل ',
                                      )}${(widget.centerModel != null && widget.centerModel != '' ? CenterModelStruct.fromMap(widget.centerModel) : null)?.name}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ].map((c) => DataCell(c)).toList())
                            .map((e) => DataRow(cells: e))
                            .toList(),
                        headingRowColor: MaterialStateProperty.all(
                          FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        headingRowHeight: 56.0,
                        dataRowColor: MaterialStateProperty.all(
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        dataRowHeight: 56.0,
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        dividerThickness: 1.0,
                        showBottomBorder: true,
                        minWidth: 49.0,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
