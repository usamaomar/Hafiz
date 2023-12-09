import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/developer_pages/add_user_dialog/add_user_dialog_widget.dart';
import '/pages/developer_pages/asign_teatcher_dialog/asign_teatcher_dialog_widget.dart';
import '/pages/developer_pages/showser_dialog/showser_dialog_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'add_admins_page_model.dart';
export 'add_admins_page_model.dart';

class AddAdminsPageWidget extends StatefulWidget {
  const AddAdminsPageWidget({super.key});

  @override
  _AddAdminsPageWidgetState createState() => _AddAdminsPageWidgetState();
}

class _AddAdminsPageWidgetState extends State<AddAdminsPageWidget> {
  late AddAdminsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAdminsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firebaseListOfUseres = await queryUserCollectionRecordOnce();
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
            'ufus4mf0' /*  */,
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 20.0, 0.0),
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
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: FFLocalizations.of(context).getText(
                              'bouh0nkl' /* Search */,
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontWeight: FontWeight.w500,
                                  ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 46.0,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showAlignedDialog(
                              context: context,
                              isGlobal: true,
                              avoidOverflow: false,
                              targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: const SizedBox(
                                      height: 500.0,
                                      child: AddUserDialogWidget(),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                      'y9lxu6r2' /* Name */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '0a4cyotz' /* Phone Number */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'aivrqb6f' /* Type */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ogrnc2u2' /* Show */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                            ],
                            rows: dataTableList
                                .mapIndexed((dataTableListIndex,
                                        dataTableListItem) =>
                                    [
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showAlignedDialog(
                                              context: context,
                                              isGlobal: true,
                                              avoidOverflow: false,
                                              targetAnchor:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: SizedBox(
                                                      height: 500.0,
                                                      child:
                                                          ShowserDialogWidget(
                                                        userModel:
                                                            dataTableListItem
                                                                .toMap(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Text(
                                            dataTableListItem.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        dataTableListItem.phoneNumber,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        functions.getUserTypeName(
                                            FFLocalizations.of(context)
                                                .languageCode,
                                            dataTableListItem.userType),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showAlignedDialog(
                                              context: context,
                                              isGlobal: true,
                                              avoidOverflow: false,
                                              targetAnchor:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child:
                                                        AsignTeatcherDialogWidget(
                                                      userParams:
                                                          dataTableListItem,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: FaIcon(
                                            FontAwesomeIcons.leanpub,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
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
                    Align(
                      alignment: const AlignmentDirectional(0.00, -1.00),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60.0,
                          child: custom_widgets.PullToRefreshCustome(
                            width: double.infinity,
                            height: 60.0,
                            pulledAction: () async {
                              _model.firebaseListOfUseresCopy =
                                  await queryUserCollectionRecordOnce();
                              setState(() {
                                FFAppState().usereAppStateList = [];
                              });
                              setState(() {
                                _model.userLocalStateList = [];
                              });
                              setState(() {
                                FFAppState().usereAppStateList = functions
                                    .convertFromFirebaseToUserList(_model
                                        .firebaseListOfUseresCopy!
                                        .toList())
                                    .toList()
                                    .cast<UserModelStruct>();
                              });
                              setState(() {
                                _model.userLocalStateList = FFAppState()
                                    .usereAppStateList
                                    .toList()
                                    .cast<UserModelStruct>();
                              });

                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
