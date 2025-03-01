import 'dart:async';
import 'package:eride/singup1.dart';
import 'package:eride/user/Inquirynow.dart';
import 'package:eride/user/Profileuser.dart';
import 'package:eride/user/homepage.dart';
import 'package:eride/welcompage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Singup1()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "RYDO",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontFamily: 'calibri',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Lottie.asset(
                'assets/animations/loading.json',
                height: 250,
                width: 420,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
