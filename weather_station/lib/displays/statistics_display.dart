// ignore_for_file: avoid_print

import 'package:weather_station/interfaces/display_element.dart';
import 'package:weather_station/interfaces/observer.dart';
import 'package:weather_station/data/weather_data.dart';

class StatisticsDisplay implements Observer, DisplayElement {
  double _maxTemp = 0.0;
  double _minTemp = 200;
  double _tempSum = 0.0;
  double _numReadings = 0;
  WeatherData? _weatherData;

  StatisticsDisplay(WeatherData weatherData) {
    _weatherData = weatherData;
    _weatherData!.registerObserver(this);
  }

  @override
  void update(double temp, double humidity, double pressure) {
    _tempSum += temp;
    _numReadings++;
    if (temp > _maxTemp) {
      _maxTemp = temp;
    }
    if (temp < _minTemp) {
      _minTemp = temp;
    }
    display();
  }

  @override
  void display() {
    double res = _tempSum / _numReadings;
    print("Avg/Max/Min temperature = $res / $_maxTemp/ $_minTemp");
  }
}
