import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MesMedicamentsRecord extends FirestoreRecord {
  MesMedicamentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ind" field.
  int? _ind;
  int get ind => _ind ?? 0;
  bool hasInd() => _ind != null;

  // "gtin" field.
  int? _gtin;
  int get gtin => _gtin ?? 0;
  bool hasGtin() => _gtin != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "dateExp" field.
  String? _dateExp;
  String get dateExp => _dateExp ?? '';
  bool hasDateExp() => _dateExp != null;

  // "dateScan" field.
  DateTime? _dateScan;
  DateTime? get dateScan => _dateScan;
  bool hasDateScan() => _dateScan != null;

  // "prescription" field.
  String? _prescription;
  String get prescription => _prescription ?? '';
  bool hasPrescription() => _prescription != null;

  void _initializeFields() {
    _ind = snapshotData['ind'] as int?;
    _gtin = snapshotData['gtin'] as int?;
    _lang = snapshotData['lang'] as String?;
    _nom = snapshotData['nom'] as String?;
    _dateExp = snapshotData['dateExp'] as String?;
    _dateScan = snapshotData['dateScan'] as DateTime?;
    _prescription = snapshotData['prescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mes_medicaments');

  static Stream<MesMedicamentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MesMedicamentsRecord.fromSnapshot(s));

  static Future<MesMedicamentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MesMedicamentsRecord.fromSnapshot(s));

  static MesMedicamentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MesMedicamentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MesMedicamentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MesMedicamentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MesMedicamentsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMesMedicamentsRecordData({
  int? ind,
  int? gtin,
  String? lang,
  String? nom,
  String? dateExp,
  DateTime? dateScan,
  String? prescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ind': ind,
      'gtin': gtin,
      'lang': lang,
      'nom': nom,
      'dateExp': dateExp,
      'dateScan': dateScan,
      'prescription': prescription,
    }.withoutNulls,
  );

  return firestoreData;
}
