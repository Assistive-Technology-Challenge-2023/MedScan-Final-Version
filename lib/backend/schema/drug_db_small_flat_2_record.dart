import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrugDbSmallFlat2Record extends FirestoreRecord {
  DrugDbSmallFlat2Record._(
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
      FirebaseFirestore.instance.collection('drug_db_small_flat_2');

  static Stream<DrugDbSmallFlat2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrugDbSmallFlat2Record.fromSnapshot(s));

  static Future<DrugDbSmallFlat2Record> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DrugDbSmallFlat2Record.fromSnapshot(s));

  static DrugDbSmallFlat2Record fromSnapshot(DocumentSnapshot snapshot) =>
      DrugDbSmallFlat2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrugDbSmallFlat2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrugDbSmallFlat2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrugDbSmallFlat2Record(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDrugDbSmallFlat2RecordData({
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
