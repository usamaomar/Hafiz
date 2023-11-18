import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UserCollectionRecord extends FirestoreRecord {
  UserCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "user_type" field.
  int? _userType;
  int get userType => _userType ?? 0;
  bool hasUserType() => _userType != null;

  // "admin_reference" field.
  DocumentReference? _adminReference;
  DocumentReference? get adminReference => _adminReference;
  bool hasAdminReference() => _adminReference != null;

  // "center_reference" field.
  DocumentReference? _centerReference;
  DocumentReference? get centerReference => _centerReference;
  bool hasCenterReference() => _centerReference != null;

  // "parents_reference" field.
  DocumentReference? _parentsReference;
  DocumentReference? get parentsReference => _parentsReference;
  bool hasParentsReference() => _parentsReference != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "savedAyahList" field.
  List<SavedSuraModelStruct>? _savedAyahList;
  List<SavedSuraModelStruct> get savedAyahList => _savedAyahList ?? const [];
  bool hasSavedAyahList() => _savedAyahList != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _password = snapshotData['password'] as String?;
    _userType = castToType<int>(snapshotData['user_type']);
    _adminReference = snapshotData['admin_reference'] as DocumentReference?;
    _centerReference = snapshotData['center_reference'] as DocumentReference?;
    _parentsReference = snapshotData['parents_reference'] as DocumentReference?;
    _age = snapshotData['age'] as String?;
    _savedAyahList = getStructList(
      snapshotData['savedAyahList'],
      SavedSuraModelStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userCollection');

  static Stream<UserCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCollectionRecord.fromSnapshot(s));

  static Future<UserCollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCollectionRecord.fromSnapshot(s));

  static UserCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCollectionRecordData({
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  String? password,
  int? userType,
  DocumentReference? adminReference,
  DocumentReference? centerReference,
  DocumentReference? parentsReference,
  String? age,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'password': password,
      'user_type': userType,
      'admin_reference': adminReference,
      'center_reference': centerReference,
      'parents_reference': parentsReference,
      'age': age,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCollectionRecordDocumentEquality
    implements Equality<UserCollectionRecord> {
  const UserCollectionRecordDocumentEquality();

  @override
  bool equals(UserCollectionRecord? e1, UserCollectionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.password == e2?.password &&
        e1?.userType == e2?.userType &&
        e1?.adminReference == e2?.adminReference &&
        e1?.centerReference == e2?.centerReference &&
        e1?.parentsReference == e2?.parentsReference &&
        e1?.age == e2?.age &&
        listEquality.equals(e1?.savedAyahList, e2?.savedAyahList);
  }

  @override
  int hash(UserCollectionRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.password,
        e?.userType,
        e?.adminReference,
        e?.centerReference,
        e?.parentsReference,
        e?.age,
        e?.savedAyahList
      ]);

  @override
  bool isValidKey(Object? o) => o is UserCollectionRecord;
}
