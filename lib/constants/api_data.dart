class ApiData {


  ///  .get('${ApiData.weatherBaseApi}?q=$location&appid=${ApiData.apiKey}');
  ///api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

  static String weatherBaseApi =
      "http://api.openweathermap.org/data/2.5/weather";
  static String weatherIconApi = "http://openweathermap.org/img/wn/";
  static String apiKey = "882f87fcc6d2e0794e1e7e9dc389c767";
}
