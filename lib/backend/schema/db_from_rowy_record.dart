import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DbFromRowyRecord extends FirestoreRecord {
  DbFromRowyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _id = snapshotData['id'] as int?;
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('db_from_rowy');

  static Stream<DbFromRowyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DbFromRowyRecord.fromSnapshot(s));

  static Future<DbFromRowyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DbFromRowyRecord.fromSnapshot(s));

  static DbFromRowyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DbFromRowyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DbFromRowyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DbFromRowyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DbFromRowyRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDbFromRowyRecordData({
  int? id,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}
