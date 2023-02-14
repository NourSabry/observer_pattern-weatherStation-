// import 'package:observer/observer.dart';

import 'package:weather_station/interfaces/observer.dart';

abstract class Subject {
  void registerObserver(Observer o);
  void removeObserver(Observer o);
  void notifyObserver();
}
