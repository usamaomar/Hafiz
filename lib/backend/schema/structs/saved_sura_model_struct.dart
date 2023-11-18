// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedSuraModelStruct extends FFFirebaseStruct {
  SavedSuraModelStruct({
    int? savedAyah,
    int? ayahId,
    int? nextSavedAyah,
    DateTime? nextSavedAyahDate,
    DateTime? savedAyahDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _savedAyah = savedAyah,
        _ayahId = ayahId,
        _nextSavedAyah = nextSavedAyah,
        _nextSavedAyahDate = nextSavedAyahDate,
        _savedAyahDate = savedAyahDate,
        super(firestoreUtilData);

  // "savedAyah" field.
  int? _savedAyah;
  int get savedAyah => _savedAyah ?? 0;
  set savedAyah(int? val) => _savedAyah = val;
  void incrementSavedAyah(int amount) => _savedAyah = savedAyah + amount;
  bool hasSavedAyah() => _savedAyah != null;

  // "ayahId" field.
  int? _ayahId;
  int get ayahId => _ayahId ?? 0;
  set ayahId(int? val) => _ayahId = val;
  void incrementAyahId(int amount) => _ayahId = ayahId + amount;
  bool hasAyahId() => _ayahId != null;

  // "nextSavedAyah" field.
  int? _nextSavedAyah;
  int get nextSavedAyah => _nextSavedAyah ?? 0;
  set nextSavedAyah(int? val) => _nextSavedAyah = val;
  void incrementNextSavedAyah(int amount) =>
      _nextSavedAyah = nextSavedAyah + amount;
  bool hasNextSavedAyah() => _nextSavedAyah != null;

  // "nextSavedAyahDate" field.
  DateTime? _nextSavedAyahDate;
  DateTime? get nextSavedAyahDate => _nextSavedAyahDate;
  set nextSavedAyahDate(DateTime? val) => _nextSavedAyahDate = val;
  bool hasNextSavedAyahDate() => _nextSavedAyahDate != null;

  // "savedAyahDate" field.
  DateTime? _savedAyahDate;
  DateTime? get savedAyahDate => _savedAyahDate;
  set savedAyahDate(DateTime? val) => _savedAyahDate = val;
  bool hasSavedAyahDate() => _savedAyahDate != null;

  static SavedSuraModelStruct fromMap(Map<String, dynamic> data) =>
      SavedSuraModelStruct(
        savedAyah: castToType<int>(data['savedAyah']),
        ayahId: castToType<int>(data['ayahId']),
        nextSavedAyah: castToType<int>(data['nextSavedAyah']),
        nextSavedAyahDate: data['nextSavedAyahDate'] as DateTime?,
        savedAyahDate: data['savedAyahDate'] as DateTime?,
      );

  static SavedSuraModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SavedSuraModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'savedAyah': _savedAyah,
        'ayahId': _ayahId,
        'nextSavedAyah': _nextSavedAyah,
        'nextSavedAyahDate': _nextSavedAyahDate,
        'savedAyahDate': _savedAyahDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'savedAyah': serializeParam(
          _savedAyah,
          ParamType.int,
        ),
        'ayahId': serializeParam(
          _ayahId,
          ParamType.int,
        ),
        'nextSavedAyah': serializeParam(
          _nextSavedAyah,
          ParamType.int,
        ),
        'nextSavedAyahDate': serializeParam(
          _nextSavedAyahDate,
          ParamType.DateTime,
        ),
        'savedAyahDate': serializeParam(
          _savedAyahDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SavedSuraModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SavedSuraModelStruct(
        savedAyah: deserializeParam(
          data['savedAyah'],
          ParamType.int,
          false,
        ),
        ayahId: deserializeParam(
          data['ayahId'],
          ParamType.int,
          false,
        ),
        nextSavedAyah: deserializeParam(
          data['nextSavedAyah'],
          ParamType.int,
          false,
        ),
        nextSavedAyahDate: deserializeParam(
          data['nextSavedAyahDate'],
          ParamType.DateTime,
          false,
        ),
        savedAyahDate: deserializeParam(
          data['savedAyahDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SavedSuraModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SavedSuraModelStruct &&
        savedAyah == other.savedAyah &&
        ayahId == other.ayahId &&
        nextSavedAyah == other.nextSavedAyah &&
        nextSavedAyahDate == other.nextSavedAyahDate &&
        savedAyahDate == other.savedAyahDate;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [savedAyah, ayahId, nextSavedAyah, nextSavedAyahDate, savedAyahDate]);
}

SavedSuraModelStruct createSavedSuraModelStruct({
  int? savedAyah,
  int? ayahId,
  int? nextSavedAyah,
  DateTime? nextSavedAyahDate,
  DateTime? savedAyahDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SavedSuraModelStruct(
      savedAyah: savedAyah,
      ayahId: ayahId,
      nextSavedAyah: nextSavedAyah,
      nextSavedAyahDate: nextSavedAyahDate,
      savedAyahDate: savedAyahDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SavedSuraModelStruct? updateSavedSuraModelStruct(
  SavedSuraModelStruct? savedSuraModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    savedSuraModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSavedSuraModelStructData(
  Map<String, dynamic> firestoreData,
  SavedSuraModelStruct? savedSuraModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (savedSuraModel == null) {
    return;
  }
  if (savedSuraModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && savedSuraModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final savedSuraModelData =
      getSavedSuraModelFirestoreData(savedSuraModel, forFieldValue);
  final nestedData =
      savedSuraModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = savedSuraModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSavedSuraModelFirestoreData(
  SavedSuraModelStruct? savedSuraModel, [
  bool forFieldValue = false,
]) {
  if (savedSuraModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(savedSuraModel.toMap());

  // Add any Firestore field values
  savedSuraModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSavedSuraModelListFirestoreData(
  List<SavedSuraModelStruct>? savedSuraModels,
) =>
    savedSuraModels
        ?.map((e) => getSavedSuraModelFirestoreData(e, true))
        .toList() ??
    [];
