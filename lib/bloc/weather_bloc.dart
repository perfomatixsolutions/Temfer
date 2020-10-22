import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Temfer/models/weather_model.dart';
import 'package:Temfer/repo/weather_update_repo.dart';

class WeatherEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class FetchWeather extends WeatherEvent {
  @override
  List<Object> get props => [];
}

class ResetWeather extends WeatherEvent {}

class WeatherState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final _weather;

  WeatherIsLoaded(this._weather);

  @override
  List<Object> get props => [_weather];
}

class WeatherNotLoaded extends WeatherState {}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo);

  @override
  // TODO: implement initialState
  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchWeather) {
      yield WeatherIsLoading();

      try {
        WeatherData weather = await weatherRepo.fetchWeather();
        yield WeatherIsLoaded(weather);
      } catch (_) {
        print(_);
        yield WeatherNotLoaded();
      }
    } else if (event is ResetWeather) {}
  }
}
