import 'package:flutter/material.dart';
import 'package:Temfer/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
         /* textTheme: GoogleFonts.oxygenTextTheme(
            Theme.of(context).textTheme,
          )*/),
      home: SplashScreen(),
    );
  }
}
