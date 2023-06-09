// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScannedMedicineStruct extends FFFirebaseStruct {
  ScannedMedicineStruct({
    int? ind,
    String? expirationDate,
    String? name,
    DateTime? scannedDate,
    int? gtin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ind = ind,
        _expirationDate = expirationDate,
        _name = name,
        _scannedDate = scannedDate,
        _gtin = gtin,
        super(firestoreUtilData);

  // "ind" field.
  int? _ind;
  int get ind => _ind ?? 0;
  set ind(int? val) => _ind = val;
  void incrementInd(int amount) => _ind = ind + amount;
  bool hasInd() => _ind != null;

  // "expirationDate" field.
  String? _expirationDate;
  String get expirationDate => _expirationDate ?? '';
  set expirationDate(String? val) => _expirationDate = val;
  bool hasExpirationDate() => _expirationDate != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "scannedDate" field.
  DateTime? _scannedDate;
  DateTime? get scannedDate => _scannedDate;
  set scannedDate(DateTime? val) => _scannedDate = val;
  bool hasScannedDate() => _scannedDate != null;

  // "gtin" field.
  int? _gtin;
  int get gtin => _gtin ?? 0;
  set gtin(int? val) => _gtin = val;
  void incrementGtin(int amount) => _gtin = gtin + amount;
  bool hasGtin() => _gtin != null;

  static ScannedMedicineStruct fromMap(Map<String, dynamic> data) =>
      ScannedMedicineStruct(
        ind: data['ind'] as int?,
        expirationDate: data['expirationDate'] as String?,
        name: data['name'] as String?,
        scannedDate: data['scannedDate'] as DateTime?,
        gtin: data['gtin'] as int?,
      );

  static ScannedMedicineStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ScannedMedicineStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'ind': _ind,
        'expirationDate': _expirationDate,
        'name': _name,
        'scannedDate': _scannedDate,
        'gtin': _gtin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ind': serializeParam(
          _ind,
          ParamType.int,
        ),
        'expirationDate': serializeParam(
          _expirationDate,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'scannedDate': serializeParam(
          _scannedDate,
          ParamType.DateTime,
        ),
        'gtin': serializeParam(
          _gtin,
          ParamType.int,
        ),
      }.withoutNulls;

  static ScannedMedicineStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScannedMedicineStruct(
        ind: deserializeParam(
          data['ind'],
          ParamType.int,
          false,
        ),
        expirationDate: deserializeParam(
          data['expirationDate'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        scannedDate: deserializeParam(
          data['scannedDate'],
          ParamType.DateTime,
          false,
        ),
        gtin: deserializeParam(
          data['gtin'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ScannedMedicineStruct(${toMap()})';
}

ScannedMedicineStruct createScannedMedicineStruct({
  int? ind,
  String? expirationDate,
  String? name,
  DateTime? scannedDate,
  int? gtin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScannedMedicineStruct(
      ind: ind,
      expirationDate: expirationDate,
      name: name,
      scannedDate: scannedDate,
      gtin: gtin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScannedMedicineStruct? updateScannedMedicineStruct(
  ScannedMedicineStruct? scannedMedicine, {
  bool clearUnsetFields = true,
}) =>
    scannedMedicine
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addScannedMedicineStructData(
  Map<String, dynamic> firestoreData,
  ScannedMedicineStruct? scannedMedicine,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (scannedMedicine == null) {
    return;
  }
  if (scannedMedicine.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && scannedMedicine.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scannedMedicineData =
      getScannedMedicineFirestoreData(scannedMedicine, forFieldValue);
  final nestedData =
      scannedMedicineData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = scannedMedicine.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScannedMedicineFirestoreData(
  ScannedMedicineStruct? scannedMedicine, [
  bool forFieldValue = false,
]) {
  if (scannedMedicine == null) {
    return {};
  }
  final firestoreData = mapToFirestore(scannedMedicine.toMap());

  // Add any Firestore field values
  scannedMedicine.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScannedMedicineListFirestoreData(
  List<ScannedMedicineStruct>? scannedMedicines,
) =>
    scannedMedicines
        ?.map((e) => getScannedMedicineFirestoreData(e, true))
        .toList() ??
    [];
