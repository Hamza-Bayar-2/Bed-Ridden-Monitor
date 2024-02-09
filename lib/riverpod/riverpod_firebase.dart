
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodFirebase extends ChangeNotifier{
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('heartRate');
  DatabaseReference heartRateReference(){
    return _databaseReference;
  }


}

final riverpodFirebase = ChangeNotifierProvider((ref) => RiverpodFirebase());