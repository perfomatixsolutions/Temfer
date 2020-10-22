class WeatherData {
  Main main;
  String name;
  int cod;
  List<Weather> weather;

  WeatherData({this.main, this.name, this.cod, this.weather});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var list = json['weather'] as List;
    List<Weather> weather = list.map((i) => Weather.fromJson(i)).toList();

    return WeatherData(
        main: Main.fromJson(json['main']),
        name: json['name'],
        cod: json['cod'],
        weather: weather );
  }
}

class Main {
  double temp;
  double feels_like;
  int humidity;
  double temp_min;
  double temp_max;

  Main({this.temp, this.feels_like, this.humidity,
  this.temp_max,this.temp_min});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json["temp"],
        feels_like: json["feels_like"],
        temp_min: json["temp_min"],
        temp_max: json["temp_max"],
        humidity: json["humidity"]);
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }

}
