import 'dart:convert';

import 'package:api_to_sqlite_flutter/src/models/employee_model.dart';
import 'package:api_to_sqlite_flutter/src/providers/db_provider.dart';
import 'package:api_to_sqlite_flutter/src/providers/employee_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('CHARLOTTE HORNETS                  ', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.settings_input_antenna),
              onPressed: () async {
                await _loadFromApi();
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
            child: Image.network("https://media.giphy.com/media/3oKIPe3PiZ9XLl1Inm/giphy.gif", height: 250),
            )
          : _buildPlayersListView(),        
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
                      Icons.sports_basketball,
                      color: Colors.deepPurple,
                      size: 28,
                    ),
                    onPressed: () {
                      //just re-pull UI for testing purposes
                      //todoBloc.getTodos();
                      DBProvider.db.deleteAllPlayers();
                      Navigator.pushNamed(context, 'myteam');
                    }),
                Expanded(
                  child: Text(
                    "Creat your own player",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RobotoMono',
                        fontStyle: FontStyle.normal,
                        fontSize: 19),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
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
                bottom: MediaQuery.of(context).viewInsets.top),
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
                                      color: Colors.indigoAccent,
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
                                      color: Colors.indigoAccent,
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
                                      color: Colors.indigoAccent,
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
                                      color: Colors.indigoAccent,
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
                                      color: Colors.indigoAccent,
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
                                      color: Colors.indigoAccent,
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
                              backgroundColor: Colors.indigoAccent,
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
                                      country: (LastseenController.value.text));
                                  if (newPlayer.number != null) {
                                    DBProvider.db.createPlayer(newPlayer);
                                    DBProvider.db.getAllPlayers();
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

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DBProvider.db.deleteAllPlayers();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All Players deleted');
  }

  _buildPlayersListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllPlayers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(

          );
        } else {
          return Container(
            decoration: BoxDecoration(image: 
            DecorationImage(colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
             image: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/c/c4/Charlotte_Hornets_%282014%29.svg/1200px-Charlotte_Hornets_%282014%29.svg.png"))),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black12,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(snapshot.data[index].image ?? "https://graffica.info/wp-content/uploads/2017/08/NBA-logo-png-download-free-1200x900.png", height: 60),
                  title: Text(
                      "#${snapshot.data[index].number}   ${snapshot.data[index].name} - (${snapshot.data[index].position})", style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${snapshot.data[index].lastseen} - ${snapshot.data[index].country}', style: TextStyle(fontWeight: FontWeight.bold)),
                );
              },
            ),
          );
        }
      },
    );
  }
}
