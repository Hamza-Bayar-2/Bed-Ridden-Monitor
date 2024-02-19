import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution_challenge/pages/oxygen_level_page.dart';
import '../pages/velocity_result_page.dart';
import '../pages/body_temperature_page.dart';
import '../pages/gsr_sensor_result_page.dart';
import '../pages/heart_rate_page.dart';

final bottomNavigationBarProvider = StateProvider<int>(
  (ref) {
    int index = 0;
    return index;
  }
);

Widget pageController(int index){
  switch (index) {
    case 0:
      return const HeartRatePage();
    case 1:
      return const BodyTemperaturePage();
    case 2:
      return const OxygenLevelPage();
    case 3:
      return const GsrSensorResultPage();
    case 4:
      return const VelocityResultsPage();
    case 5:
      return const BodyTemperaturePage();
    default:
      return const HeartRatePage();
  }
}