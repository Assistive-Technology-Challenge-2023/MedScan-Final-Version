import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrugDbMiniFlatRecord extends FirestoreRecord {
  DrugDbMiniFlatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ind" field.
  int? _ind;
  int get ind => _ind ?? 0;
  bool hasInd() => _ind != null;

  // "sub_ind" field.
  int? _subInd;
  int get subInd => _subInd ?? 0;
  bool hasSubInd() => _subInd != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "paragraph" field.
  String? _paragraph;
  String get paragraph => _paragraph ?? '';
  bool hasParagraph() => _paragraph != null;

  void _initializeFields() {
    _ind = snapshotData['ind'] as int?;
    _subInd = snapshotData['sub_ind'] as int?;
    _title = snapshotData['title'] as String?;
    _paragraph = snapshotData['paragraph'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drug_db_mini_flat');

  static Stream<DrugDbMiniFlatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrugDbMiniFlatRecord.fromSnapshot(s));

  static Future<DrugDbMiniFlatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrugDbMiniFlatRecord.fromSnapshot(s));

  static DrugDbMiniFlatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrugDbMiniFlatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrugDbMiniFlatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrugDbMiniFlatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrugDbMiniFlatRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDrugDbMiniFlatRecordData({
  int? ind,
  int? subInd,
  String? title,
  String? paragraph,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ind': ind,
      'sub_ind': subInd,
      'title': title,
      'paragraph': paragraph,
    }.withoutNulls,
  );

  return firestoreData;
}
