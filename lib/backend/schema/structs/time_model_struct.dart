// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeModelStruct extends FFFirebaseStruct {
  TimeModelStruct({
    int? calculationValue,
    int? sufxCalculationModel,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _calculationValue = calculationValue,
        _sufxCalculationModel = sufxCalculationModel,
        super(firestoreUtilData);

  // "calculationValue" field.
  int? _calculationValue;
  int get calculationValue => _calculationValue ?? 0;
  set calculationValue(int? val) => _calculationValue = val;
  void incrementCalculationValue(int amount) =>
      _calculationValue = calculationValue + amount;
  bool hasCalculationValue() => _calculationValue != null;

  // "sufxCalculationModel" field.
  int? _sufxCalculationModel;
  int get sufxCalculationModel => _sufxCalculationModel ?? 0;
  set sufxCalculationModel(int? val) => _sufxCalculationModel = val;
  void incrementSufxCalculationModel(int amount) =>
      _sufxCalculationModel = sufxCalculationModel + amount;
  bool hasSufxCalculationModel() => _sufxCalculationModel != null;

  static TimeModelStruct fromMap(Map<String, dynamic> data) => TimeModelStruct(
        calculationValue: castToType<int>(data['calculationValue']),
        sufxCalculationModel: castToType<int>(data['sufxCalculationModel']),
      );

  static TimeModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TimeModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'calculationValue': _calculationValue,
        'sufxCalculationModel': _sufxCalculationModel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'calculationValue': serializeParam(
          _calculationValue,
          ParamType.int,
        ),
        'sufxCalculationModel': serializeParam(
          _sufxCalculationModel,
          ParamType.int,
        ),
      }.withoutNulls;

  static TimeModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimeModelStruct(
        calculationValue: deserializeParam(
          data['calculationValue'],
          ParamType.int,
          false,
        ),
        sufxCalculationModel: deserializeParam(
          data['sufxCalculationModel'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TimeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimeModelStruct &&
        calculationValue == other.calculationValue &&
        sufxCalculationModel == other.sufxCalculationModel;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([calculationValue, sufxCalculationModel]);
}

TimeModelStruct createTimeModelStruct({
  int? calculationValue,
  int? sufxCalculationModel,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimeModelStruct(
      calculationValue: calculationValue,
      sufxCalculationModel: sufxCalculationModel,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimeModelStruct? updateTimeModelStruct(
  TimeModelStruct? timeModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timeModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimeModelStructData(
  Map<String, dynamic> firestoreData,
  TimeModelStruct? timeModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timeModel == null) {
    return;
  }
  if (timeModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timeModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timeModelData = getTimeModelFirestoreData(timeModel, forFieldValue);
  final nestedData = timeModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timeModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimeModelFirestoreData(
  TimeModelStruct? timeModel, [
  bool forFieldValue = false,
]) {
  if (timeModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timeModel.toMap());

  // Add any Firestore field values
  timeModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimeModelListFirestoreData(
  List<TimeModelStruct>? timeModels,
) =>
    timeModels?.map((e) => getTimeModelFirestoreData(e, true)).toList() ?? [];
