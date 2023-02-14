// ignore_for_file: avoid_print

import 'package:weather_station/interfaces/display_element.dart';
import 'package:weather_station/interfaces/observer.dart'  ;
import 'package:weather_station/data/weather_data.dart';
 
class CurrentConditionDisplay implements Observer, DisplayElement {
  double? _temp;
  double? _humidity;
  WeatherData? _weatherData;

  CurrentConditionDisplay(WeatherData weatherData) {
    _weatherData = weatherData;
    _weatherData!.registerObserver(this);
  }

  @override
  void update(double temp, double humidity, double pressure) {
    _humidity = humidity;
    _temp = temp;
    display();
  }

  @override
  void display() {
    print("Current Conditions : $_temp F degrees and $_humidity% humidity");
  }
}
