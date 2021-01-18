import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';
import 'package:api_to_sqlite_flutter/src/providers/db_provider.dart';
import 'package:dio/dio.dart';

class CharlotteApiProvider {
  Future<List<Player>> getAllPlayers() async {
    var url = "http://demo5946778.mockable.io/charlotteplayers";
    Response response = await Dio().get(url);

    return (response.data as List).map((player) {
      print('Inserting $player');
      DBProvider.db.createPlayer(Player.fromJson(player));
    }).toList();
  }
}
