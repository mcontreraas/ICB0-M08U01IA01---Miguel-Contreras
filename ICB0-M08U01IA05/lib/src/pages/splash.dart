import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:disenos/src/pages/botones_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:disenos/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'basico_page.dart';


class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
          duration: 1000,
          splash: Icons.games, splashIconSize: 150,
          nextScreen: HomePage(),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.pinkAccent
        )
    );
  }
}
