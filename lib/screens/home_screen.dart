import 'dart:async';
import 'dart:ui';

import 'package:Temfer/constants/api_data.dart';
import 'package:Temfer/constants/app_constants.dart';
import 'package:Temfer/models/weather_model.dart';
import 'package:Temfer/repo/weather_update_repo.dart';
import 'package:Temfer/screens/search_location.dart';
import 'package:Temfer/theme/theme.dart';
import 'package:Temfer/widgets/dot_loader.dart';
import 'package:Temfer/widgets/login_background_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 0;
  double _backHeight = 0;

  Future<WeatherData> futureWeather;

  _startAnimationTimer() async {
    var _duration = Duration(milliseconds: 100);
    return Timer(_duration, _incrementHeight);
  }

  _startWeatherUpdateTimer() async {
    var _duration = Duration(minutes: 30);
    return Timer(_duration, WeatherRepo().fetchWeather);
  }

  _incrementHeight() {
    setState(() {
      _backHeight = 75;
      _height = 60;
    });
  }

  void _navigateToPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchLocation()));
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    futureWeather = WeatherRepo().fetchWeather();
    _startAnimationTimer();
  }

  _getCurrentLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print("Position :::: ${position.latitude}");
    print("Position :::: ${position.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    //final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Hero(
          tag: headingHeroTag,
          child: Text(
            "Temfer",
            style: headingText,
          ),
        ),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                height: _backHeight,
                duration: Duration(milliseconds: 800),
                curve: Curves.easeIn,
                child: CustomPaint(
                  size: Size(_size.width, 75),
                  painter: LoginBackgroundTwo(_size),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                height: _height,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                child: CustomPaint(
                  size: Size(_size.width, 60),
                  painter: LoginBackground(_size),
                ),
              ),
            ),
            FutureBuilder<WeatherData>(
                future: futureWeather,
                builder: (context, snapshot) {
                  print("SnapshotData ::::: ${snapshot.data}");
                  if (snapshot.hasData) {
                    return LiquidPullToRefresh(
                      showChildOpacityTransition: false,
                      color: Colors.orange,
                      onRefresh: () async {
                        setState(() {
                          WeatherRepo().fetchWeather();
                        });
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: locationHeroTag,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 21,
                                  ),
                                ),
                                Text(" ${snapshot.data.name}",
                                    style: locationText),
                              ],
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0, top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.thermometerEmpty,
                                    size: 40,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),

                                  /*Icon(
                                    CupertinoIcons.brightness_solid,
                                    size: 130,
                                    color: Colors.white.withOpacity(.84),
                                  ),*/
                                  (snapshot.data != null)
                                      ? Text(
                                          "${((snapshot.data.main.temp) -  kelvinConst).round()}°C",
                                          style: weatherText,
                                        )
                                      : Text(
                                          "--°C",
                                          style: weatherText,
                                        ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            if (snapshot.hasData)
                              Text(
                                "Feels like ${((snapshot.data.main.feels_like) - kelvinConst).round()}°C",
                                style: feelsLikeText,
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (snapshot.data.weather != null)
                                    Image.network(
                                      "${ApiData.weatherIconApi + snapshot.data.weather[0].icon}.png",
                                      height: 35,
                                      width: 35,
                                      scale: .5,
                                      color: Colors.black87,
                                    ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  (snapshot.data.weather != null)
                                      ? Text(
                                          "${snapshot.data.weather[0].description}",
                                          style: descriptionText,
                                        )
                                      : Text(""),
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.opacity,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(" ${snapshot.data.main.humidity}",
                                    style: humidityText),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: DotLoader(),
                    );
                  }
                })
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, right: 30),
        child: FloatingActionButton(
          heroTag:  searchLocationHeroTag,
          elevation: 4,
          onPressed: _navigateToPage,
          child: Icon(
            Icons.location_on_outlined,
            color: Colors.amber,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
