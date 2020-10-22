import 'package:Temfer/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class SearchBar  extends StatelessWidget {

  String searchText = "";

  SearchBar(this.searchText)

  @override
  Widget build(BuildContext context) {
    return
  }

}*/

class SearchBar extends StatefulWidget {


/*  String searchText ;

  SearchBar(this.searchText);*/

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(right: 20,left: 20),
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
    );
  }
}



