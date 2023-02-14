// ignore_for_file: avoid_print

import 'package:weather_station/interfaces/display_element.dart';
import 'package:weather_station/interfaces/observer.dart';
import 'package:weather_station/data/weather_data.dart';

class ForecastDisplay implements Observer, DisplayElement {
  double _currentPresssure = 29.92;
  double? _lastPressure;
  WeatherData? _weatherData;

  ForecastDisplay(WeatherData weatherData) {
    _weatherData = weatherData;
    _weatherData!.registerObserver(this);
  }

  @override
  void update(double temp, double humidiy, double pressure) {
    _lastPressure = _currentPresssure;
    _currentPresssure = pressure;

    display();
  }

  @override
  void display() {
    print("Forecast: ");
    if (_currentPresssure > _lastPressure!) {
      print("imroving wather n the way");
    } else if (_currentPresssure == _lastPressure) {
      print("More of the same");
    } else if (_currentPresssure < _lastPressure!) {
      print("Watch out for cooler, rainy weather");
    }
  }
}
