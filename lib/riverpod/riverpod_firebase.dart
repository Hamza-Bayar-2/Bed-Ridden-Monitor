
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodFirebase extends ChangeNotifier{
  String _heartRate = "0";
  String _temperature = "0";
  String _oxygen = "0";
  String _gsr = "0";
  String _velocityX = "0";
  String _velocityY = "0";
  String _velocityZ = "0";
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

  String getVelocityX(){
    return _velocityX;
  }

  String getVelocityY(){
    return _velocityY;
  }

  String getVelocityZ(){
    return _velocityZ;
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

  void changeVelocityX(String num){
    _velocityX = num;
    notifyListeners();
  }

  void changeVelocityY(String num){
    _velocityY = num;
    notifyListeners();
  }

  void changeVelocityZ(String num){
    _velocityZ = num;
    notifyListeners();
  }
}

final riverpodFirebase = ChangeNotifierProvider((ref) {
  final provider = RiverpodFirebase();
  provider.getInitialized(); // Initialize the value
  return provider;
});