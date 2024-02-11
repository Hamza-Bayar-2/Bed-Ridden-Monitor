import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution_challenge/riverpod/riverpod_firebase.dart';
import 'package:solution_challenge/widgets/pages_main_widget.dart';

import '../content/app_colors.dart';
import '../widgets/heart_beat_animation.dart';
import 'body_temperature_page.dart';

class HeartRatePage extends ConsumerStatefulWidget {
  const HeartRatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HeartRatePage> createState() => _HeartRatePageState();
}

class _HeartRatePageState extends ConsumerState<HeartRatePage> {
  var colors = AppColors();
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("heartRate");

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    var rivFirRead = ref.read(riverpodFirebase);
    databaseRef.onValue.listen((event) {
        rivFirRead.changeHeartRate(event.snapshot.value as int);
      print(rivFirRead.getHeartRate());
    });
  }

  @override
  Widget build(BuildContext context) {
    var rivFirWatch = ref.watch(riverpodFirebase);

    return FutureBuilder(
      future: databaseRef.get(),
      builder: (context, snapshot){
        if(snapshot.hasData){

          return mainWidget(
              context,
              "Heart Rate",
              "${rivFirWatch.getHeartRate()} bpm",
              BeatingHeart(heartbeatRate: rivFirWatch.getHeartRate()),
              const Center(child: Text("grafik", style: TextStyle(fontSize: 50),),), /// geçici
              Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Heart Rates"
          );

        } else if(snapshot.hasError){
          return const Center(child: Text("Somthing Went Wrong", style: TextStyle(fontSize: 50),),); /// err olunca başka bişey vermeli
        } else {
          return mainWidget(
              context,
              "Heart Rate",
              "0 bpm",
              const Icon(Icons.favorite, color: Colors.red, size: 50.0),
              const Center(child: Text("grafik", style: TextStyle(fontSize: 50),),), /// geçici
              Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Heart Rates"
          );;
        }
      },
    );
  }
}
