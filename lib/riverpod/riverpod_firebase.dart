
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodFirebase extends ChangeNotifier{
  int _heartRate = 1;
  int _temperature = 1;
  int _oxygen = 1;
  int _gsr = 1;
  int _acceleration = 1;
  bool initialized = false;

  int getHeartRate(){
    return _heartRate;
  }

  int getTemperature(){
    return _temperature;
  }

  int getOxygen(){
    return _oxygen;
  }

  int getGsr(){
    return _gsr;
  }

  int getAcceleration(){
    return _acceleration;
  }

  bool getInitialized() {
    return initialized;
  }

  void initialize() {
    initialized = true;
    notifyListeners();
  }

  void changeHeartRate(int num){
    _heartRate = num;
    notifyListeners();
  }

  void changeTemperature(int num){
    _temperature = num;
    notifyListeners();
  }

  void changeOxygen(int num){
    _oxygen = num;
    notifyListeners();
  }

  void changeGsr(int num){
    _gsr = num;
    notifyListeners();
  }

  void changeAcceleration(int num){
    _acceleration = num;
    notifyListeners();
  }
}

final riverpodFirebase = ChangeNotifierProvider((ref) {
  final provider = RiverpodFirebase();
  provider.getInitialized(); // Initialize the value
  return provider;
});