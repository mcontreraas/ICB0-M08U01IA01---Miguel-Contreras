import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBA Best Rookies 19-20 🏀',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'NBA Best Rookies 19-20 🏀',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
..add(Dog('Ja Morant', 'Memphis Grizzlies, TN, USA', 
        'PG - In 59 games, 17.6 ppg and 6.8 apg while shooting 49.1% overall and 36.7% on 3-pointers.', 'https://b.fssta.com/uploads/application/nba/headshots/3279.vresize.350.425.medium.98.png'))
..add(Dog('Kendrick Nunn', 'Miami Heat, FL, USA',
        'G - In 62 games (all starts), Nunn averaged 15.6 points on 44.8% shooting (36.2% on 3-pointers) and was one of the biggest surprises of this rookie class.', 'https://b.fssta.com/uploads/application/nba/headshots/3128.png'))

..add(Dog('Zion Williamson', 'New Orleans Pelicans, LA, USA',
        'F - Williamson finishes the season averaging 23.6 ppg and 6.8 rpg while shooting 58.9%.', 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4395628.png&w=350&h=254'))
..add(Dog('Coby White', 'Chicago Bulls, IL, USA',
        'G - Was the best scoring rookie after the All-Star break (24.7 ppg) while shooting 46.8% from the field (40.7% on 3-pointers). His shooting numbers on the season are concerning (39.4% FG, 36.5% on 3-pointers), but he was a game changer when he had it going.'
        , 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4395651.png'))
..add(Dog('RJ Barret', 'New York Knicks, NY, USA',
        'G - Barrett finishes as the fourth best scorer (14.3 ppg), while grabbing 5.0 rebounds (5th among rookies) and managed to get his shooting percentage over 40% with a March in which he shot 44.8% from the field (averaging 18.7 ppg this month).'
        , 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4395625.png'))
..add(Dog('Brandon Clarke','Memphis Grizzlies, TN, USA', 
        'F - Clarke excelled in the NBA in all the same ways in did with the ‘Zags on his way to averaging 12 points and nearly six rebounds per game.'
        , 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3906665.png'))
..add(Dog('Michael Porter','Denver Nuggets, CO, USA', 
        'F - A long and bouncy 6’9 forward, Porter showed soft shooting touch all over the floor by hitting 42 percent of his threes and finishing with 59 percent true shooting.'
        , 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4278104.png&w=350&h=254'))
..add(Dog('Terence Davis','Toronto Raptors, Canada', 
        'G - He hit nearly 40 percent of his three-pointers and played solid defense while finishing with per-100 possession averages of 21.7 points, 9.5 rebounds, and 4.7 assists per game.'
        , 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3919454.png'))
..add(Dog('Tyler Herro','Miami Heat, FL, USA', 
        'SG - Herro took 47 percent of his shots from three-point range and made them at a 39 percent clip. Herro was already an elite shooter off spot-ups, finishing in the 95th percentile on such play types, per Synergy Sports.'
        , 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4395725.png'))
..add(Dog('P.J. Washington','Charlotte Hornets, NC, USA', 
        'F - Washington took nearly 40 percent of his shots from three-point range and hit them at a 37.4 percent clip. He also offers value as a rebounder and defender, giving Charlotte the lineup flexibility to move him all over the court.'
        , 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4278078.png'))
..add(Dog('Matisse Thybulle','Philadelphia 76ers, PA, USA', 
        'F - He finished as one of only nine players ever to post a block and steal rate greater than three percent — two of the others are prime seasons from David Robinson and Hakeem Olajuwon.'
        , 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3907498.png&w=350&h=254'));


  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black45,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              //gradient: new LinearGradient(
                //  begin: Alignment.topRight,
                 // end: Alignment.bottomLeft,
                  //stops: [
               // .1,
               // .5,
                //.7,
               // .9
              //],
                //  colors: [
                //Colors.white10,
                //Colors.white12,
                //Colors.white24,
                //Colors.white30
              //])),
          image: DecorationImage(
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
          image: new NetworkImage(
          'https://i.pinimg.com/736x/6b/e1/d1/6be1d1d2d129f253c2b22f81b86264e6.jpg'),
          fit: BoxFit.cover
          )),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
