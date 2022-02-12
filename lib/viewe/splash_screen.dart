import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:tic_tac_game/viewe/home_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    double heightS = MediaQuery.of(context).size.height;
    return EasySplashScreen(
      logo: Image.asset(
        "assets/image/splash.gif",
      ),
      title: Text(
        "Tic Tac Game",
        style: TextStyle(
          fontSize: heightS * 0.05,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      logoSize: heightS * 0.15,
      backgroundColor: const Color(0xff000619),
      showLoader: true,
      loaderColor: Colors.white,
      navigator: const HomeScreen(),
      durationInSeconds: 3,
    );
  }
}
