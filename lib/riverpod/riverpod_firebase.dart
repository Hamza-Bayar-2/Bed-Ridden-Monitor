
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodFirebase extends ChangeNotifier{
  String _heartRate = "0";
  String _temperature = "0";
  String _oxygen = "0";
  String _gsr = "0";
  String _acceleration = "0";
  bool initialized = false;

  String getHeartRate(){
    return _heartRate;
  }

  String getTemperature(){
    return _temperature;
  }

  String getOxygen(){
    return _oxygen;
  }

  String getGsr(){
    return _gsr;
  }

  String getAcceleration(){
    return _acceleration;
  }

  bool getInitialized() {
    return initialized;
  }

  void initialize() {
    initialized = true;
    notifyListeners();
  }

  void changeHeartRate(String num){
    _heartRate = num;
    notifyListeners();
  }

  void changeTemperature(String num){
    _temperature = num;
    notifyListeners();
  }

  void changeOxygen(String num){
    _oxygen = num;
    notifyListeners();
  }

  void changeGsr(String num){
    _gsr = num;
    notifyListeners();
  }

  void changeAcceleration(String num){
    _acceleration = num;
    notifyListeners();
  }
}

final riverpodFirebase = ChangeNotifierProvider((ref) {
  final provider = RiverpodFirebase();
  provider.getInitialized(); // Initialize the value
  return provider;
});