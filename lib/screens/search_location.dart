import 'package:Temfer/constants/app_constants.dart';
import 'package:Temfer/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchLocation extends StatefulWidget {
  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),

      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0,right: 20,left: 20),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: TextEditingController(text: ""),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Location",
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 15),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            color: Colors.white,
                            elevation:1,
                            child:
                            Icon(Icons.search),
                            borderRadius:
                            BorderRadius.circular(35),
                            textStyle: feelsLikeText,
                          ),
                        )),
                  ),
                ),
              ),
            ),


            Hero(tag: locationHeroTag,
                child: Icon(Icons.location_on,color: Colors.redAccent,))

            /*Center(
              child: Hero(
                tag: 'searchLocationHeroTag',
                child: Material(
                  borderRadius: BorderRadius.circular(40),
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Icon(Icons.location_on),
                  ),
                ),
              ),
            )*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        heroTag: 'searchLocationHeroTag',
        backgroundColor: Colors.orange,
        child: Icon(Icons.arrow_forward_outlined),
      ),
    );
  }
}
