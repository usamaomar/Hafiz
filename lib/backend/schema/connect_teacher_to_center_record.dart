import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ConnectTeacherToCenterRecord extends FirestoreRecord {
  ConnectTeacherToCenterRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "teacher_reference" field.
  DocumentReference? _teacherReference;
  DocumentReference? get teacherReference => _teacherReference;
  bool hasTeacherReference() => _teacherReference != null;

  // "center_refrence" field.
  DocumentReference? _centerRefrence;
  DocumentReference? get centerRefrence => _centerRefrence;
  bool hasCenterRefrence() => _centerRefrence != null;

  void _initializeFields() {
    _teacherReference = snapshotData['teacher_reference'] as DocumentReference?;
    _centerRefrence = snapshotData['center_refrence'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('connectTeacherToCenter');

  static Stream<ConnectTeacherToCenterRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ConnectTeacherToCenterRecord.fromSnapshot(s));

  static Future<ConnectTeacherToCenterRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConnectTeacherToCenterRecord.fromSnapshot(s));

  static ConnectTeacherToCenterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConnectTeacherToCenterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConnectTeacherToCenterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConnectTeacherToCenterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConnectTeacherToCenterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConnectTeacherToCenterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConnectTeacherToCenterRecordData({
  DocumentReference? teacherReference,
  DocumentReference? centerRefrence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teacher_reference': teacherReference,
      'center_refrence': centerRefrence,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConnectTeacherToCenterRecordDocumentEquality
    implements Equality<ConnectTeacherToCenterRecord> {
  const ConnectTeacherToCenterRecordDocumentEquality();

  @override
  bool equals(
      ConnectTeacherToCenterRecord? e1, ConnectTeacherToCenterRecord? e2) {
    return e1?.teacherReference == e2?.teacherReference &&
        e1?.centerRefrence == e2?.centerRefrence;
  }

  @override
  int hash(ConnectTeacherToCenterRecord? e) =>
      const ListEquality().hash([e?.teacherReference, e?.centerRefrence]);

  @override
  bool isValidKey(Object? o) => o is ConnectTeacherToCenterRecord;
}
