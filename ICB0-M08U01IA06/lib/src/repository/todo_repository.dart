import 'package:api_to_sqlite_flutter/src/providers/db_provider.dart';
import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';

class TodoRepository {

  Future getAllPlayers({String query}) => DBProvider.db.getAllPlayers();

  Future insertPlayer(Player player) => DBProvider.db.createPlayer(player);

  Future deletePlayerByNumber(int number) => DBProvider.db.deletePlayer(number);

  //We are not going to use this in the demo
  Future deleteAllPlayers() => DBProvider.db.deleteAllPlayers();
}
