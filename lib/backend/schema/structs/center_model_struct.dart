// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CenterModelStruct extends FFFirebaseStruct {
  CenterModelStruct({
    String? name,
    String? phoneNumber,
    LatLng? location,
    DocumentReference? modelReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _phoneNumber = phoneNumber,
        _location = location,
        _modelReference = modelReference,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;
  bool hasLocation() => _location != null;

  // "model_reference" field.
  DocumentReference? _modelReference;
  DocumentReference? get modelReference => _modelReference;
  set modelReference(DocumentReference? val) => _modelReference = val;
  bool hasModelReference() => _modelReference != null;

  static CenterModelStruct fromMap(Map<String, dynamic> data) =>
      CenterModelStruct(
        name: data['name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        location: data['location'] as LatLng?,
        modelReference: data['model_reference'] as DocumentReference?,
      );

  static CenterModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CenterModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'phone_number': _phoneNumber,
        'location': _location,
        'model_reference': _modelReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'model_reference': serializeParam(
          _modelReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CenterModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CenterModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        modelReference: deserializeParam(
          data['model_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['centerCollection'],
        ),
      );

  @override
  String toString() => 'CenterModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CenterModelStruct &&
        name == other.name &&
        phoneNumber == other.phoneNumber &&
        location == other.location &&
        modelReference == other.modelReference;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, phoneNumber, location, modelReference]);
}

CenterModelStruct createCenterModelStruct({
  String? name,
  String? phoneNumber,
  LatLng? location,
  DocumentReference? modelReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CenterModelStruct(
      name: name,
      phoneNumber: phoneNumber,
      location: location,
      modelReference: modelReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CenterModelStruct? updateCenterModelStruct(
  CenterModelStruct? centerModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    centerModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCenterModelStructData(
  Map<String, dynamic> firestoreData,
  CenterModelStruct? centerModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (centerModel == null) {
    return;
  }
  if (centerModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && centerModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final centerModelData =
      getCenterModelFirestoreData(centerModel, forFieldValue);
  final nestedData =
      centerModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = centerModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCenterModelFirestoreData(
  CenterModelStruct? centerModel, [
  bool forFieldValue = false,
]) {
  if (centerModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(centerModel.toMap());

  // Add any Firestore field values
  centerModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCenterModelListFirestoreData(
  List<CenterModelStruct>? centerModels,
) =>
    centerModels?.map((e) => getCenterModelFirestoreData(e, true)).toList() ??
    [];
