import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';
import 'package:api_to_sqlite_flutter/src/providers/db_provider.dart';
import 'package:api_to_sqlite_flutter/src/providers/employee_api_provider.dart';
import 'package:api_to_sqlite_flutter/src/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';

class Myteam extends StatefulWidget {
  const Myteam({Key key}) : super(key: key);

    @override
  _MyteamPageState createState() => _MyteamPageState();
}

class _MyteamPageState extends State<Myteam> {
  var isLoading = false;

final TodoBloc todoBloc = TodoBloc();

  //Allows Todo card to be dismissable horizontally
  final DismissDirection _dismissDirection = DismissDirection.horizontal;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
                child: Container(
                    decoration: BoxDecoration(image: 
            DecorationImage(colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
             image: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/c/c4/Charlotte_Hornets_%282014%29.svg/1200px-Charlotte_Hornets_%282014%29.svg.png"))),
                    //This is where the magic starts
                    child: getTodosWidget()))),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.grey, width: 0.3),
            )),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.spa_outlined,
                      color: Colors.deepPurple,
                      size: 28,
                    ),
                    onPressed: () {
                      //just re-pull UI for testing purposes
                      todoBloc.getPlayers();
                    }),
                Expanded(
                  child: Text(
                    "Hornets",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.normal,
                        fontSize: 19),
                  ),
                ),
                Wrap(children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () async {
                      await _loadFromApi();
                      Navigator.pushNamed(context, 'home');
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                  )
                ])
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: FloatingActionButton(
            elevation: 5.0,
            onPressed: () {
              _showAddTodoSheet(context);
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add,
              size: 32,
              color: Colors.deepPurple,
            ),
          ),
        ));
  }

  void _showAddTodoSheet(BuildContext context) {
    final NumberController= TextEditingController();
    final ImageController = TextEditingController();
    final NameController = TextEditingController();
    final PositionController = TextEditingController();
    final LastseenController = TextEditingController();
    final CountryController = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: new Container(
              color: Colors.transparent,
              child: new Container(
                height: 230,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15, top: 25.0, right: 15, bottom: 30),
                  child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                                                    Expanded(
                            child: TextFormField(
                              controller: NumberController,
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w400),
                              autofocus: false,
                              decoration: const InputDecoration(
                                  hintText: '',
                                  labelText: 'Number',
                                  labelStyle: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500)),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Empty description!';
                                }
                                return value.contains('')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),             
                        Expanded(
                            child: TextFormField(
                              controller: ImageController,
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w400),
                              autofocus: false,
                              decoration: const InputDecoration(
                                  hintText: '',
                                  labelText: 'Image',
                                  labelStyle: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500)),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Empty description!';
                                }
                                return value.contains('')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                                                  Expanded(
                            child: TextFormField(
                              controller: NameController,
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w400),
                              autofocus: false,
                              decoration: const InputDecoration(
                                  hintText: '',
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500)),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Empty description!';
                                }
                                return value.contains('')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                                                  Expanded(
                            child: TextFormField(
                              controller: PositionController,
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w400),
                              autofocus: false,
                              decoration: const InputDecoration(
                                  hintText: '',
                                  labelText: 'Position',
                                  labelStyle: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500)),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Empty description!';
                                }
                                return value.contains('')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                                                  Expanded(
                            child: TextFormField(
                              controller: LastseenController,
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w400),
                              autofocus: false,
                              decoration: const InputDecoration(
                                  hintText: '',
                                  labelText: 'Lastseen',
                                  labelStyle: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500)),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Empty description!';
                                }
                                return value.contains('')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: CountryController,
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w400),
                              autofocus: false,
                              decoration: const InputDecoration(
                                  hintText: '',
                                  labelText: 'Country',
                                  labelStyle: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500)),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Empty description!';
                                }
                                return value.contains('')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 15),
                            child: CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              radius: 18,
                              child: IconButton(
                                icon: Icon(
                                  Icons.save,
                                  size: 22,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  final newPlayer = Player(
                                      number: int.parse(NumberController
                                              .value.text),
                                      image: (ImageController.value.text),
                                      name: (NameController.value.text),
                                      position: (PositionController.value.text),
                                      lastseen: (LastseenController.value.text),
                                      country: (CountryController.value.text));
                                  if (newPlayer.number != null) {
                                    /*Create new Todo object and make sure
                                    the Todo description is not empty,
                                    because what's the point of saving empty
                                    Todo
                                    */
                                    todoBloc.addPlayer(newPlayer);

                                    //dismisses the bottomsheet
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget getTodosWidget() {
    /*The StreamBuilder widget,
    basically this widget will take stream of data (todos)
    and construct the UI (with state) based on the stream
    */
    return StreamBuilder(
      stream: todoBloc.players,
      builder: (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
        return getTodoCardWidget(snapshot);
      },
    );
  }

  Widget getTodoCardWidget(AsyncSnapshot<List<Player>> snapshot) {
    /*Since most of our operations are asynchronous
    at initial state of the operation there will be no stream
    so we need to handle it if this was the case
    by showing users a processing/loading indicator*/
    if (snapshot.hasData) {
      /*Also handles whenever there's stream
      but returned returned 0 records of Todo from DB.
      If that the case show user that you have empty Todos
      */
      return snapshot.data.length != 0
          ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, itemPosition) {
                Player player = snapshot.data[itemPosition];
                final Widget dismissibleCard = new Dismissible(
                  background: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Deleting",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    color: Colors.redAccent,
                  ),
                  onDismissed: (direction) {
                    /*The magic
                    delete Todo item by ID whenever
                    the card is dismissed
                    */
                    todoBloc.deletePlayerByNumber(player.number);
                  },
                  direction: _dismissDirection,
                  key: new ObjectKey(player),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[200], width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.white,
                      child: ListTile(
                      leading: 
                      Image.network(player.image ?? "https://graffica.info/wp-content/uploads/2017/08/NBA-logo-png-download-free-1200x900.png", height: 60),
                       title: Text(
                      "#${player.number}   ${player.name} - (${player.position})", style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${player.lastseen} - ${player.country}', style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                );
                return dismissibleCard;
              },
            )
          : Container(
              decoration: BoxDecoration(image: DecorationImage(colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop), image: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/c/c4/Charlotte_Hornets_%282014%29.svg/1200px-Charlotte_Hornets_%282014%29.svg.png"))),
              child: Center(
              //this is used whenever there 0 Todo
              //in the data base
              child: noTodoMessageWidget(),
            ));
    } else {
      return Center(
        /*since most of our I/O operations are done
        outside the main thread asynchronously
        we may want to display a loading indicator
        to let the use know the app is currently
        processing*/
        child: loadingData(),
      );
    }
  }
  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = CharlotteApiProvider();
    await apiProvider.getAllPlayers();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  Widget loadingData() {
    //pull todos again
    todoBloc.getPlayers();
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text("Loading...",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget noTodoMessageWidget() {
    return Container(
      child: Text(
        "Time to create your first player...",
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
      ),
    );
  }

  dispose() {
    /*close the stream in order
    to avoid memory leaks
    */
    todoBloc.dispose();
  }
}
