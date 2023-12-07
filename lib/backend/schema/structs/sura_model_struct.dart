// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuraModelStruct extends FFFirebaseStruct {
  SuraModelStruct({
    int? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    int? numberOfAyahs,
    String? revelationType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _number = number,
        _name = name,
        _englishName = englishName,
        _englishNameTranslation = englishNameTranslation,
        _numberOfAyahs = numberOfAyahs,
        _revelationType = revelationType,
        super(firestoreUtilData);

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "englishName" field.
  String? _englishName;
  String get englishName => _englishName ?? '';
  set englishName(String? val) => _englishName = val;
  bool hasEnglishName() => _englishName != null;

  // "englishNameTranslation" field.
  String? _englishNameTranslation;
  String get englishNameTranslation => _englishNameTranslation ?? '';
  set englishNameTranslation(String? val) => _englishNameTranslation = val;
  bool hasEnglishNameTranslation() => _englishNameTranslation != null;

  // "numberOfAyahs" field.
  int? _numberOfAyahs;
  int get numberOfAyahs => _numberOfAyahs ?? 0;
  set numberOfAyahs(int? val) => _numberOfAyahs = val;
  void incrementNumberOfAyahs(int amount) =>
      _numberOfAyahs = numberOfAyahs + amount;
  bool hasNumberOfAyahs() => _numberOfAyahs != null;

  // "revelationType" field.
  String? _revelationType;
  String get revelationType => _revelationType ?? '';
  set revelationType(String? val) => _revelationType = val;
  bool hasRevelationType() => _revelationType != null;

  static SuraModelStruct fromMap(Map<String, dynamic> data) => SuraModelStruct(
        number: castToType<int>(data['number']),
        name: data['name'] as String?,
        englishName: data['englishName'] as String?,
        englishNameTranslation: data['englishNameTranslation'] as String?,
        numberOfAyahs: castToType<int>(data['numberOfAyahs']),
        revelationType: data['revelationType'] as String?,
      );

  static SuraModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SuraModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'number': _number,
        'name': _name,
        'englishName': _englishName,
        'englishNameTranslation': _englishNameTranslation,
        'numberOfAyahs': _numberOfAyahs,
        'revelationType': _revelationType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'englishName': serializeParam(
          _englishName,
          ParamType.String,
        ),
        'englishNameTranslation': serializeParam(
          _englishNameTranslation,
          ParamType.String,
        ),
        'numberOfAyahs': serializeParam(
          _numberOfAyahs,
          ParamType.int,
        ),
        'revelationType': serializeParam(
          _revelationType,
          ParamType.String,
        ),
      }.withoutNulls;

  static SuraModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SuraModelStruct(
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        englishName: deserializeParam(
          data['englishName'],
          ParamType.String,
          false,
        ),
        englishNameTranslation: deserializeParam(
          data['englishNameTranslation'],
          ParamType.String,
          false,
        ),
        numberOfAyahs: deserializeParam(
          data['numberOfAyahs'],
          ParamType.int,
          false,
        ),
        revelationType: deserializeParam(
          data['revelationType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SuraModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SuraModelStruct &&
        number == other.number &&
        name == other.name &&
        englishName == other.englishName &&
        englishNameTranslation == other.englishNameTranslation &&
        numberOfAyahs == other.numberOfAyahs &&
        revelationType == other.revelationType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        number,
        name,
        englishName,
        englishNameTranslation,
        numberOfAyahs,
        revelationType
      ]);
}

SuraModelStruct createSuraModelStruct({
  int? number,
  String? name,
  String? englishName,
  String? englishNameTranslation,
  int? numberOfAyahs,
  String? revelationType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SuraModelStruct(
      number: number,
      name: name,
      englishName: englishName,
      englishNameTranslation: englishNameTranslation,
      numberOfAyahs: numberOfAyahs,
      revelationType: revelationType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SuraModelStruct? updateSuraModelStruct(
  SuraModelStruct? suraModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    suraModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSuraModelStructData(
  Map<String, dynamic> firestoreData,
  SuraModelStruct? suraModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (suraModel == null) {
    return;
  }
  if (suraModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && suraModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final suraModelData = getSuraModelFirestoreData(suraModel, forFieldValue);
  final nestedData = suraModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = suraModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSuraModelFirestoreData(
  SuraModelStruct? suraModel, [
  bool forFieldValue = false,
]) {
  if (suraModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(suraModel.toMap());

  // Add any Firestore field values
  suraModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSuraModelListFirestoreData(
  List<SuraModelStruct>? suraModels,
) =>
    suraModels?.map((e) => getSuraModelFirestoreData(e, true)).toList() ?? [];
