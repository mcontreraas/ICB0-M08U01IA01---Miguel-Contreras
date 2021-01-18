import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';
import 'package:api_to_sqlite_flutter/src/repository/todo_repository.dart';


import 'dart:async';

class TodoBloc {
  //Get instance of the Repository
  final _todoRepository = TodoRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _playerController = StreamController<List<Player>>.broadcast();

  get players => _playerController.stream;

  TodoBloc() {
    getPlayers();
  }

  getPlayers({String query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _playerController.sink.add(await _todoRepository.getAllPlayers(query: query));
  }

  addPlayer(Player player) async {
    await _todoRepository.insertPlayer(player);
    getPlayers();
  }

    deletePlayerByNumber(int num) async {
    _todoRepository.deletePlayerByNumber(num);
    getPlayers();
  }

  deletePlayers() async {
    _todoRepository.deleteAllPlayers();
    getPlayers();
  }

  dispose() {
    _playerController.close();
  }
}
