import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_sone_dialog_model.dart';
export 'add_sone_dialog_model.dart';

class AddSoneDialogWidget extends StatefulWidget {
  const AddSoneDialogWidget({
    super.key,
    required this.centerReference,
    required this.parentReferences,
  });

  final DocumentReference? centerReference;
  final DocumentReference? parentReferences;

  @override
  _AddSoneDialogWidgetState createState() => _AddSoneDialogWidgetState();
}

class _AddSoneDialogWidgetState extends State<AddSoneDialogWidget> {
  late AddSoneDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddSoneDialogModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: const Color(0xFF2F2F2F),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'd4idxgat' /* Sone Name */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodyMedium,
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
                            color: FlutterFlowTheme.of(context).primary,
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
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(50.0, 15.0, 50.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
                      options: [
                        FFLocalizations.of(context).getText(
                          'xxsgb6la' /* 5 */,
                        ),
                        FFLocalizations.of(context).getText(
                          '6qlp4gna' /* 6 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'vhxrhcs2' /* 7 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'v9i36wsg' /* 8 */,
                        ),
                        FFLocalizations.of(context).getText(
                          '8fdmlitv' /* 9 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'psuan6ak' /* 10 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'ra0qtayd' /* 11 */,
                        ),
                        FFLocalizations.of(context).getText(
                          '5yywswql' /* 12 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'wfsnel8q' /* 13 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'f0mdtmfk' /* 14 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'bfsn3dwx' /* 15 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'dcht3ugl' /* 16 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'xdlsxt3v' /* 17 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'zhwcu792' /* 18 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'mbkrk4kq' /* 19 */,
                        ),
                        FFLocalizations.of(context).getText(
                          'vegszlmv' /* 20 */,
                        )
                      ],
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue = val),
                      width: 300.0,
                      height: 50.0,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      hintText: FFLocalizations.of(context).getText(
                        'qy2u5co4' /* Age */,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var shouldSetState = false;
                    if (_model.textController.text != '') {
                      var userCollectionRecordReference =
                          UserCollectionRecord.collection.doc();
                      await userCollectionRecordReference
                          .set(createUserCollectionRecordData(
                        displayName: _model.textController.text,
                        createdTime: getCurrentTimestamp,
                        userType: 3,
                        adminReference: FFAppState().userModel.modelReference,
                        centerReference: widget.centerReference,
                        parentsReference: widget.parentReferences,
                      ));
                      _model.addparentCollection =
                          UserCollectionRecord.getDocumentFromData(
                              createUserCollectionRecordData(
                                displayName: _model.textController.text,
                                createdTime: getCurrentTimestamp,
                                userType: 3,
                                adminReference:
                                    FFAppState().userModel.modelReference,
                                centerReference: widget.centerReference,
                                parentsReference: widget.parentReferences,
                              ),
                              userCollectionRecordReference);
                      shouldSetState = true;
                      _model.firebaseListOfUseres2 =
                          await queryUserCollectionRecordOnce();
                      shouldSetState = true;
                      setState(() {
                        FFAppState().usereAppStateList = functions
                            .convertFromFirebaseToUserList(
                                _model.firebaseListOfUseres2!.toList())
                            .toList()
                            .cast<UserModelStruct>();
                      });
                      Navigator.pop(context);
                    } else {
                      if (shouldSetState) setState(() {});
                      return;
                    }

                    if (shouldSetState) setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    '0tunl9xu' /* Save */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFD9D4D4),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF363636),
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
