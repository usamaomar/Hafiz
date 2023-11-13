import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CenterCollectionRecord extends FirestoreRecord {
  CenterCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('centerCollection');

  static Stream<CenterCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CenterCollectionRecord.fromSnapshot(s));

  static Future<CenterCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CenterCollectionRecord.fromSnapshot(s));

  static CenterCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CenterCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CenterCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CenterCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CenterCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CenterCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCenterCollectionRecordData({
  String? name,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class CenterCollectionRecordDocumentEquality
    implements Equality<CenterCollectionRecord> {
  const CenterCollectionRecordDocumentEquality();

  @override
  bool equals(CenterCollectionRecord? e1, CenterCollectionRecord? e2) {
    return e1?.name == e2?.name && e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(CenterCollectionRecord? e) =>
      const ListEquality().hash([e?.name, e?.phoneNumber]);

  @override
  bool isValidKey(Object? o) => o is CenterCollectionRecord;
}
