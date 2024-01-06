import 'package:locale_loom_app/res/values/app_strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/db_model/db_m.dart';

// Service class for managing SQLite database operations
class DataBaseService {

  // Database version and name constants
  static const int _version = 5;
  static const String _dbName = AppStrings.dbName;

  // Method to get the database instance
  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'locastore_dt.db'),
      onCreate: (db, version) async {
        // Create 'favourites' table on database creation
        await db.execute('CREATE TABLE favourites (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, lat REAL, lng REAL, urlPath TEXT, rating REAL, time TEXT)');
      },
      version: _version,
    );
  }

  // Method to add a record to the 'favourites' table
  static Future<int> add(Records node) async {
    final db = await _getDB();
    return await db.insert('favourites', node.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Method to delete a record from the 'favourites' table
  static Future<int> delete(Records node) async {
    final db = await _getDB();
    return await db.delete('favourites',
      where: 'id = ?',
      whereArgs: [node.id],
    );
  }

  // Method to retrieve all records from the 'favourites' table
  static Future<List<Records>> getAll() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(AppStrings.tableName);
    print(" ${maps.length}  size of db get " );
    // Convert the database query results to a list of Records objects
    return List.generate(maps.length, (index) => Records.fromJson(maps[index]));
  }
}
