import 'package:disenos/src/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:disenos/src/pages/basico_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:disenos/ui/pages/home.dart';



void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));


    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'basico',
      routes: {
        'splash' : (BuildContext context ) => Splash(),
        'basico'  : (BuildContext context ) => AnimationFive(),
        'scroll'  : (BuildContext context ) => ScrollPage(),
        'botones' : (BuildContext context ) => HomePage(),
        
      },
    );
  }
}