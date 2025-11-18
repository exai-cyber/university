import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{
  DBProvider._();
  static final DBProvider instance = DBProvider._();
  Database? _db;

  Future<Database> get db async{
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async{
    final path = join(await getDatabasesPath(), 'cars_cache.db');
    return await openDatabase(path, version: 1, onCreate: (db, v) async {
      await db.execute('''
        CREATE TABLE makes(
          id INTEGER PRIMARY KEY,
          name TEXT
        )
      ''');
      await db.execute('''
        CREATE TABLE models(
          model_id INTEGER PRIMARY KEY,
          model_name TEXT,
          make_id INTEGER,
          make_name TEXT,
          vehicle_type TEXT
        )
      ''');
      await db.execute('CREATE INDEX idx_models_make_name ON models(make_name)');
      await db.execute('CREATE INDEX idx_makes_name ON makes(name)');
    });
  }

  Future<void> insertMakes(List<Map<String, dynamic>> items) async{
    final dbClient = await db;
    final batch = dbClient.batch();
    for (final it in items) {
      batch.insert('makes', it, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<Map<String, dynamic>>> getMakes() async{
    final dbClient = await db;
    return await dbClient.query('makes', orderBy: 'name ASC', limit: 1000);
  }

  Future<void> clearMakes() async{
    final dbClient = await db;
    await dbClient.delete('makes');
  }

  Future<void> insertModels(List<Map<String, dynamic>> items) async{
    final dbClient = await db;
    final batch = dbClient.batch();
    for (final it in items) {
      batch.insert('models', it, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<Map<String, dynamic>>> getModelsForMake(String makeName) async{
    final dbClient = await db;
    return await dbClient.query(
      'models',
      where: 'make_name = ?',
      whereArgs: [makeName],
      orderBy: 'model_name ASC',
    );
  }

  Future<void> clearModelsForMake(String makeName) async{
    final dbClient = await db;
    await dbClient.delete('models', where: 'make_name = ?', whereArgs: [makeName]);
  }
}
