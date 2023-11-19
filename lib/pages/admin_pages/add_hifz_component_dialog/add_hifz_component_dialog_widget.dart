import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'add_hifz_component_dialog_model.dart';
export 'add_hifz_component_dialog_model.dart';

class AddHifzComponentDialogWidget extends StatefulWidget {
  const AddHifzComponentDialogWidget({
    super.key,
    required this.suraJsonModel,
    required this.soneReference,
  });

  final dynamic suraJsonModel;
  final DocumentReference? soneReference;

  @override
  _AddHifzComponentDialogWidgetState createState() =>
      _AddHifzComponentDialogWidgetState();
}

class _AddHifzComponentDialogWidgetState
    extends State<AddHifzComponentDialogWidget> {
  late AddHifzComponentDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddHifzComponentDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().timeModelAppState = TimeModelStruct(
        calculationValue: 1,
        sufxCalculationModel: 1,
      );
      _model.soneFireBaseModel =
          await UserCollectionRecord.getDocumentOnce(widget.soneReference!);
      setState(() {
        _model.soneUserModel =
            functions.convertFromFirebaseToUserModel(_model.soneFireBaseModel!);
      });
      if (_model.soneUserModel!.savedAyahList.isNotEmpty) {
        setState(() {
          FFAppState().timeModelAppState = TimeModelStruct(
            calculationValue: functions
                .getSavedAyahModelFromFirbase(
                    _model.soneUserModel!,
                    getJsonField(
                      widget.suraJsonModel,
                      r'''$.number''',
                    ))
                ?.savedAyah,
            sufxCalculationModel: functions
                .getSavedAyahModelFromFirbase(
                    _model.soneUserModel!,
                    getJsonField(
                      widget.suraJsonModel,
                      r'''$.number''',
                    ))
                ?.nextSavedAyah,
          );
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 530.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '99uxnvjy' /* Record  Save */,
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            FFAppState().timeModelAppState = TimeModelStruct(
                              calculationValue: 1,
                            );
                          });
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                color: const Color(0xFF39D485),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 50.0,
                                    height: 150.0,
                                    child:
                                        custom_widgets.NumberScrollableWidget(
                                      width: 50.0,
                                      height: 150.0,
                                      maxAyat: getJsonField(
                                        widget.suraJsonModel,
                                        r'''$.numberOfAyahs''',
                                      ),
                                      isSavedCurrent: true,
                                      onChangeValue: () async {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'isuz2h0i' /* Saved Until Ayah */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFF39D485),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                color: const Color(0xFFE9B33C),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 50.0,
                                    height: 150.0,
                                    child:
                                        custom_widgets.NumberScrollableWidget(
                                      width: 50.0,
                                      height: 150.0,
                                      maxAyat: getJsonField(
                                        widget.suraJsonModel,
                                        r'''$.numberOfAyahs''',
                                      ),
                                      isSavedCurrent: false,
                                      onChangeValue: () async {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '8cl4qwyc' /* Save Next Time */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFE9B33C),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() {
                              FFAppState().timeModelAppState = TimeModelStruct(
                                calculationValue: 1,
                              );
                            });
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'cli486je' /* Cancel */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context).bodyLarge,
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            _model.updateSavedSuraModelStruct(
                              (e) => e
                                ..savedAyah = FFAppState()
                                    .timeModelAppState
                                    .calculationValue
                                ..ayahId = getJsonField(
                                  widget.suraJsonModel,
                                  r'''$.number''',
                                )
                                ..savedAyahDate = getCurrentTimestamp
                                ..nextSavedAyah = FFAppState()
                                    .timeModelAppState
                                    .sufxCalculationModel,
                            );
                          });
                          _model.sonFirebaseObject =
                              await UserCollectionRecord.getDocumentOnce(
                                  widget.soneReference!);
                          setState(() {
                            _model.soneJsonModel = functions
                                .convertFromFirebaseToUserModel(
                                    _model.sonFirebaseObject!)
                                .toMap();
                          });

                          await widget.soneReference!.update({
                            ...mapToFirestore(
                              {
                                'savedAyahList':
                                    getSavedSuraModelListFirestoreData(
                                  functions.getOrAddSurasList(
                                      getJsonField(
                                                    _model.soneJsonModel,
                                                    r'''$''',
                                                  ) !=
                                                  null &&
                                              getJsonField(
                                                    _model.soneJsonModel,
                                                    r'''$''',
                                                  ) !=
                                                  ''
                                          ? UserModelStruct.fromMap(
                                              getJsonField(
                                              _model.soneJsonModel,
                                              r'''$''',
                                            ))
                                          : null,
                                      _model.savedSuraModel),
                                ),
                              },
                            ),
                          });
                          setState(() {
                            FFAppState().timeModelAppState = TimeModelStruct(
                              calculationValue: 1,
                            );
                          });
                          Navigator.pop(context);

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'lj4trl7s' /* Save */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).titleSmall,
                          elevation: 2.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
