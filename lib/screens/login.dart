import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Temfer/screens/home_screen.dart';
import 'package:Temfer/widgets/login_background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              size: Size(_size.width,75),
              painter: LoginBackgroundTwo(_size),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              size: Size(_size.width, 60),
              painter: LoginBackground(_size),
            ),
          ),




          /*SafeArea(

            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(

                children: [
                  Text(
                    "Splash",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "This is a test screen",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 10,
                        letterSpacing: 2),
                  ),
                ],
              ),
            ),
          ),*/


          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.ac_unit,
                    size: 50,
                    color: Colors.black38,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Splash",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "This is a test screen",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 10,
                        letterSpacing: 2),
                  ),
                ],
              ),*/
                SizedBox(
                  height: 90,
                ),
                Text(
                  "Login",
                  style: GoogleFonts.oxygen(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Username',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.supervisor_account)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                  validator: (val) =>
                      val.length < 6 ? 'Password too short.' : null,
                  obscureText: true,
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  child: FloatingActionButton(
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomeScreen()
                          ));
                    },
                    elevation: 0,
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(Icons.arrow_forward),
                  ),
                  alignment: Alignment.centerRight,
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    RichText(
                      text: TextSpan(
                          text: "New Here?",
                          style: GoogleFonts.oxygen(
                              fontSize: 11, color: Colors.black87),
                          children: [
                            TextSpan(
                                text: ' Register',
                                style: GoogleFonts.oxygen(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ]),
                    ),
                    Text("Forgot Password?",
                        style: GoogleFonts.oxygen(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent)),

                  ],
                ),
              SizedBox(height: 80,)
              ],
            ),
          ),



        ],
      ),
    );
  }
}
