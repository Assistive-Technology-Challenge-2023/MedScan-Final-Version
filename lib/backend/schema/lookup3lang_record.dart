import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Lookup3langRecord extends FirestoreRecord {
  Lookup3langRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ind_de" field.
  int? _indDe;
  int get indDe => _indDe ?? 0;
  bool hasIndDe() => _indDe != null;

  // "ind_fr" field.
  int? _indFr;
  int get indFr => _indFr ?? 0;
  bool hasIndFr() => _indFr != null;

  // "ind_it" field.
  int? _indIt;
  int get indIt => _indIt ?? 0;
  bool hasIndIt() => _indIt != null;

  // "GTIN" field.
  int? _gtin;
  int get gtin => _gtin ?? 0;
  bool hasGtin() => _gtin != null;

  void _initializeFields() {
    _indDe = snapshotData['ind_de'] as int?;
    _indFr = snapshotData['ind_fr'] as int?;
    _indIt = snapshotData['ind_it'] as int?;
    _gtin = snapshotData['GTIN'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lookup3lang');

  static Stream<Lookup3langRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Lookup3langRecord.fromSnapshot(s));

  static Future<Lookup3langRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Lookup3langRecord.fromSnapshot(s));

  static Lookup3langRecord fromSnapshot(DocumentSnapshot snapshot) =>
      Lookup3langRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Lookup3langRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Lookup3langRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Lookup3langRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createLookup3langRecordData({
  int? indDe,
  int? indFr,
  int? indIt,
  int? gtin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ind_de': indDe,
      'ind_fr': indFr,
      'ind_it': indIt,
      'GTIN': gtin,
    }.withoutNulls,
  );

  return firestoreData;
}
