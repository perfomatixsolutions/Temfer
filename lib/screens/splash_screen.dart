import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Temfer/screens/home_Screen.dart';
import 'package:Temfer/theme/theme.dart';
import 'package:Temfer/widgets/dot_loader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startTimer() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, _navigateToPage);
  }

  void _navigateToPage() {
   /* Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => HomeScreen()));*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  /*Icon(
                    FontAwesomeIcons.thermometerEmpty,
                    size: 50,
                    color: Colors.white70,
                  ),*/
                  Image.asset("images/hot.png",height: 90,
                  width: 90,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Temfer",
                    style: appNameText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "The weather around you",
                    style: tagLIneText,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: DotLoader(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }
}
