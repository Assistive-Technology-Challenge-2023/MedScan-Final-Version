import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrugdbtestRecord extends FirestoreRecord {
  DrugdbtestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ind" field.
  int? _ind;
  int get ind => _ind ?? 0;
  bool hasInd() => _ind != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  void _initializeFields() {
    _ind = snapshotData['ind'] as int?;
    _content = snapshotData['content'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drugdbtest');

  static Stream<DrugdbtestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrugdbtestRecord.fromSnapshot(s));

  static Future<DrugdbtestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrugdbtestRecord.fromSnapshot(s));

  static DrugdbtestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrugdbtestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrugdbtestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrugdbtestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrugdbtestRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDrugdbtestRecordData({
  int? ind,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ind': ind,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}
