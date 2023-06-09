import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const String _databaseName = 'drugdb.db';
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _databaseName);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launc your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flsh the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    var db = await openDatabase(path);

    // print tables once the database is loaded
    var tables = await db.rawQuery('SELECT name FROM sqlite_master WHERE type="table"');
    print('Database tables: $tables');

    return db;
  }

  Future<String> getDrugName(String gtin) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'package_info',
      columns: ['name'],
      where: 'gtin = ?',
      whereArgs: [gtin],
      limit: 1,  // Limit the query to only get 1 result
    );

    if (maps.isNotEmpty) {
      return maps.first['name'].toString();
    } else {
      throw Exception('GTIN $gtin not found');
    }
  }

  Future<int> getInd(String gtin, String lang) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'gtin_lang_lookup',
      columns: ['ind'],
      where: 'gtin = ? AND lang = ?',
      whereArgs: [gtin, lang],
      limit: 1,  // Limit the qury to only get 1 result
    );

    if (maps.isNotEmpty) {
      return maps.first['ind'];
    } else {
      throw Exception('GTIN $gtin with language $lang not found');
    }
  }

  Future<String> getLeaflet(int? ind) async {
    var db = await this.database;
    List<Map<String, dynamic>> result;

    result = await db.query(
      'drug_leaflets',
      columns: ['content'],
      where: 'id = ?',
      whereArgs: [ind],
    );

    if (result.isNotEmpty) {
      return result.first['content'];
    } else {
      throw Exception('No leaflet found for given ind and language');
    }
  }
}

