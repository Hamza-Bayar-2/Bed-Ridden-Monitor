
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodFirebase extends ChangeNotifier{
  late int _heartRate;

  int getHeartRate(){
    return _heartRate;
  }

  void changeHeartRate(int num){
    _heartRate = num;
    notifyListeners();
  }

}

final riverpodFirebase = ChangeNotifierProvider((ref) => RiverpodFirebase());