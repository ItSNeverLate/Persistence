import 'package:flutter_persistence/sqlite/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;

  static Future<Database> getDB() async {
    if (_database != null) {
      return _database;
    }

    return await _initDatabase();
  }

  static Future<Database> _initDatabase() async {
    _database =
        await openDatabase(join(await getDatabasesPath(), 'app_database.db'),
            onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    }, version: 1);

    return _database;
  }

  static Future<void> insertDog(Dog dog) async {
    final db = await getDB();

    await db.insert('gogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Dog>> dogs() async {
    final db = await getDB();

    final List<Map<String, dynamic>> maps = await db.query('dogs');

    return List.generate(
        maps.length,
            (index) =>
            Dog(
                id: maps[index]['id'],
                name: maps[index]['name'],
                age: maps[index]['age']));
  }

  static Future<void> update(Dog dog) async {
    final db = await getDB();

    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  static Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await getDB();

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
