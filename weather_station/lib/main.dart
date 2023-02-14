// ignore_for_file: unused_local_variable

import 'package:weather_station/data/weather_data.dart';
import 'package:weather_station/displays/current_condition_display.dart';
import 'package:weather_station/displays/forecast_display.dart';
import 'package:weather_station/displays/statistics_display.dart';

void main() {
  WeatherData weatherData = WeatherData();

  CurrentConditionDisplay currentDisplay = CurrentConditionDisplay(weatherData);
  StatisticsDisplay statisticsDisplay = StatisticsDisplay(weatherData);
  ForecastDisplay forecastDisplay = ForecastDisplay(weatherData);

  weatherData.setMeasurements(80, 65, 30.4);
  weatherData.setMeasurements(82, 70, 29.2);
  weatherData.setMeasurements(78, 90, 29.2);
}
