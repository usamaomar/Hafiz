import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'user_home_page_model.dart';
export 'user_home_page_model.dart';

class UserHomePageWidget extends StatefulWidget {
  const UserHomePageWidget({super.key});

  @override
  _UserHomePageWidgetState createState() => _UserHomePageWidgetState();
}

class _UserHomePageWidgetState extends State<UserHomePageWidget> {
  late UserHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserHomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firebaseListOfUseres = await queryUserCollectionRecordOnce(
        queryBuilder: (userCollectionRecord) => userCollectionRecord
            .where(
              'user_type',
              isEqualTo: 3,
            )
            .where(
              'parents_reference',
              isEqualTo: FFAppState().userModel.modelReference,
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
            '1x0xqu1f' /*  */,
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
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F0F0),
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              '6pybq6aw' /* Haves Name */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
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
                              'p2yffv31' /* Search */,
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
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        final dataList =
                            _model.userLocalStateList.map((e) => e).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: dataList.length,
                          itemBuilder: (context, dataListIndex) {
                            final dataListItem = dataList[dataListIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'q1jwv86x' /* Son Name :  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            dataListItem.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'x9wz3old' /* Age :  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            dataListItem.age,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 5.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 46.0,
                                                  fillColor: Colors.white,
                                                  icon: Icon(
                                                    Icons
                                                        .chrome_reader_mode_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      'ParentSurahsPage',
                                                      queryParameters: {
                                                        'sonModel':
                                                            serializeParam(
                                                          dataListItem.toMap(),
                                                          ParamType.JSON,
                                                        ),
                                                        'soneReference':
                                                            serializeParam(
                                                          _model
                                                              .firebaseListOfUseres?[
                                                                  dataListIndex]
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '9ntzm21o' /* Add saved */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
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
                                  await queryUserCollectionRecordOnce(
                                queryBuilder: (userCollectionRecord) =>
                                    userCollectionRecord
                                        .where(
                                          'user_type',
                                          isEqualTo: 3,
                                        )
                                        .where(
                                          'parents_reference',
                                          isEqualTo: FFAppState()
                                              .userModel
                                              .modelReference,
                                        ),
                              );
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
