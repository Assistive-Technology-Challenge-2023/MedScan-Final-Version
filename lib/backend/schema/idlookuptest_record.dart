import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdlookuptestRecord extends FirestoreRecord {
  IdlookuptestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "GTIN" field.
  int? _gtin;
  int get gtin => _gtin ?? 0;
  bool hasGtin() => _gtin != null;

  // "ind" field.
  int? _ind;
  int get ind => _ind ?? 0;
  bool hasInd() => _ind != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  void _initializeFields() {
    _gtin = snapshotData['GTIN'] as int?;
    _ind = snapshotData['ind'] as int?;
    _lang = snapshotData['lang'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('idlookuptest');

  static Stream<IdlookuptestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdlookuptestRecord.fromSnapshot(s));

  static Future<IdlookuptestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdlookuptestRecord.fromSnapshot(s));

  static IdlookuptestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IdlookuptestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdlookuptestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdlookuptestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdlookuptestRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createIdlookuptestRecordData({
  int? gtin,
  int? ind,
  String? lang,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'GTIN': gtin,
      'ind': ind,
      'lang': lang,
    }.withoutNulls,
  );

  return firestoreData;
}
