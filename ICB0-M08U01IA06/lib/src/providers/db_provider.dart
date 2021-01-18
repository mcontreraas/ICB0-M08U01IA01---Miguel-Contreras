import 'dart:io';
import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'CharlottePlayer_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE CharlottePlayer('
          'number INTEGER PRIMARY KEY,'
          'image TEXT,'
          'name TEXT,'
          'position TEXT,'
          'lastseen TEXT,'
          'country TEXT'
          ')');
    });
  }

  // Insert employee on database
  createPlayer(Player newPlayer) async {
    await deleteAllPlayers();
    final db = await database;
    final res = await db.insert('CharlottePlayer', newPlayer.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllPlayers() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM CharlottePlayer');

    return res;
  }

/*   Future<List<Player>> getAllPlayers() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM CharlottePlayer");

    List<Player> list =
        res.isNotEmpty ? res.map((c) => Player.fromJson(c)).toList() : [];

    return list;
  } */

   Future<List<Player>> getAllPlayers({List<String> columns, String query}) async {
    final db = await database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query("CharlottePlayer",
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query("CharlottePlayer", columns: columns);
    }

    List<Player> players = result.isNotEmpty
        ? result.map((item) => Player.fromJson(item)).toList()
        : [];
    return players;
  }

    Future<int> deletePlayer(int id) async {
    final db = await database;
    var res = await db.delete("CharlottePlayer", where: 'number = ?', whereArgs: [id]);

    return res;
  }
}
