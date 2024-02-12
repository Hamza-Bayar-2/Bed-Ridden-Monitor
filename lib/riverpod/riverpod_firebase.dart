
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodFirebase extends ChangeNotifier{
  int _heartRate = 1;
  bool initialized = false;

  int getHeartRate(){
    return _heartRate;
  }

  void initialize() {
    initialized = true;
    notifyListeners();
  }

  void changeHeartRate(int num){
    _heartRate = num;
    notifyListeners();
  }

  bool getInitialized() {
    return initialized;
  }

}

final riverpodFirebase = ChangeNotifierProvider((ref) {
  final provider = RiverpodFirebase();
  provider.getInitialized(); // Initialize the value
  return provider;
});