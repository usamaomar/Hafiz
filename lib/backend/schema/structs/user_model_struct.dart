// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends FFFirebaseStruct {
  UserModelStruct({
    String? displayName,
    DateTime? createdTime,
    String? password,
    String? phoneNumber,
    int? userType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _displayName = displayName,
        _createdTime = createdTime,
        _password = password,
        _phoneNumber = phoneNumber,
        _userType = userType,
        super(firestoreUtilData);

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_type" field.
  int? _userType;
  int get userType => _userType ?? 0;
  set userType(int? val) => _userType = val;
  void incrementUserType(int amount) => _userType = userType + amount;
  bool hasUserType() => _userType != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        displayName: data['display_name'] as String?,
        createdTime: data['created_time'] as DateTime?,
        password: data['password'] as String?,
        phoneNumber: data['phone_number'] as String?,
        userType: castToType<int>(data['user_type']),
      );

  static UserModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'display_name': _displayName,
        'created_time': _createdTime,
        'password': _password,
        'phone_number': _phoneNumber,
        'user_type': _userType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'user_type': serializeParam(
          _userType,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserModelStruct(
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        userType: deserializeParam(
          data['user_type'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserModelStruct &&
        displayName == other.displayName &&
        createdTime == other.createdTime &&
        password == other.password &&
        phoneNumber == other.phoneNumber &&
        userType == other.userType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([displayName, createdTime, password, phoneNumber, userType]);
}

UserModelStruct createUserModelStruct({
  String? displayName,
  DateTime? createdTime,
  String? password,
  String? phoneNumber,
  int? userType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserModelStruct(
      displayName: displayName,
      createdTime: createdTime,
      password: password,
      phoneNumber: phoneNumber,
      userType: userType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserModelStruct? updateUserModelStruct(
  UserModelStruct? userModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserModelStructData(
  Map<String, dynamic> firestoreData,
  UserModelStruct? userModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userModel == null) {
    return;
  }
  if (userModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userModelData = getUserModelFirestoreData(userModel, forFieldValue);
  final nestedData = userModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserModelFirestoreData(
  UserModelStruct? userModel, [
  bool forFieldValue = false,
]) {
  if (userModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userModel.toMap());

  // Add any Firestore field values
  userModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserModelListFirestoreData(
  List<UserModelStruct>? userModels,
) =>
    userModels?.map((e) => getUserModelFirestoreData(e, true)).toList() ?? [];
