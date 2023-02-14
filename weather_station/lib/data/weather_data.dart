 import 'package:weather_station/interfaces/subject.dart';
 import 'package:weather_station/interfaces/observer.dart'  ;


class WeatherData implements Subject {
  List<Observer> _observers = [];
  double? _temp;
  double? _humidity;
  double? _pressure;

  WeatherData() {
    _observers = [];
  }

  @override
  void registerObserver(Observer o) {
    _observers.add(o);
  }

  @override
  void removeObserver(Observer o) {
    int i = _observers.indexOf(o);
    if (i >= 0) {
      _observers.remove(o);
    }
  }

  @override
  void notifyObserver() {
    for (int i = 0; i < _observers.length; i++) {
       Observer observer = _observers[i]  ;
      observer.update(
        _temp!,
        _humidity!,
        _pressure!,
      );
    }
  }

  void measurementChanges() {
    notifyObserver();
  }

  void setMeasurements(double temp, double humidity, double pressure) {
    _humidity = humidity;
    _pressure = pressure;
    _temp = temp;
    measurementChanges();
  }

  double getTempertaure() {
    return _temp!;
  }

  double getPressure() {
    return _pressure!;
  }

  double getHumidity() {
    return _humidity!;
  }
}
