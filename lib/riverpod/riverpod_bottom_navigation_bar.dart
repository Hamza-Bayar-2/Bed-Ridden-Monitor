import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/body_temperature_page.dart';
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
      return const BodyTemperaturePage();
    case 3:
      return const BodyTemperaturePage();
    default:
      return const HeartRatePage();
  }
}