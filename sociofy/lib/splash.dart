import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_ui/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 4000),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MyApp(),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 300, 40, 100),
                child: Image.asset("images/logo.png"),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 150, 0, 50),
            //   child: Positioned(
            //     bottom: 20,
            //     top: 100,
            //     child: SizedBox(
            //       width: 100,
            //       child: Image.network("https://i.gifer.com/ZKZx.gif"),
            //     ),
            //   ),
            // ),
            // Text(
            //   "Welcome To Sociofy",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //       fontSize: 20),
            // )
          ],
        ),
      ),
    );
  }
}
