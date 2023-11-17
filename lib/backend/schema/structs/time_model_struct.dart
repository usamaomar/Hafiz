// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeModelStruct extends FFFirebaseStruct {
  TimeModelStruct({
    int? initValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _initValue = initValue,
        super(firestoreUtilData);

  // "initValue" field.
  int? _initValue;
  int get initValue => _initValue ?? 0;
  set initValue(int? val) => _initValue = val;
  void incrementInitValue(int amount) => _initValue = initValue + amount;
  bool hasInitValue() => _initValue != null;

  static TimeModelStruct fromMap(Map<String, dynamic> data) => TimeModelStruct(
        initValue: castToType<int>(data['initValue']),
      );

  static TimeModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TimeModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'initValue': _initValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'initValue': serializeParam(
          _initValue,
          ParamType.int,
        ),
      }.withoutNulls;

  static TimeModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimeModelStruct(
        initValue: deserializeParam(
          data['initValue'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TimeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimeModelStruct && initValue == other.initValue;
  }

  @override
  int get hashCode => const ListEquality().hash([initValue]);
}

TimeModelStruct createTimeModelStruct({
  int? initValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimeModelStruct(
      initValue: initValue,
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
