import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../content/app_colors.dart';
import '../riverpod/riverpod_firebase.dart';
import '../widgets/main_widget_for_pages.dart';

class OxygenLevelPage extends ConsumerStatefulWidget {
  const OxygenLevelPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OxygenLevelPage> createState() => _OxygenLevelPageState();
}

class _OxygenLevelPageState extends ConsumerState<OxygenLevelPage> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("data/oxygen");
  var customColors = AppColors();

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    var rivFirRead = ref.read(riverpodFirebase);
    databaseRef.onValue.listen((event) {
      rivFirRead.changeOxygen(event.snapshot.value as int);
      print(rivFirRead.getOxygen());
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
              customColors.lightGreen,
              "Oxygen Level",
              "${rivFirWatch.getOxygen()}%",
              SizedBox(height: 50, child: const Image(image: AssetImage("assets/icons/oxygen2.png"))),
              const Center(child: Text("grafik", style: TextStyle(fontSize: 50),),), /// geçici
              const Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Oxygen Level"
          );
        } else if(snapshot.hasError){
          return const Center(child: Text("Somthing Went Wrong", style: TextStyle(fontSize: 50),),); /// err olunca başka bişey vermeli
        } else {
          return mainWidget(
              context,
              customColors.lightGreen,
              "Oxygen Level",
              "0",
              const Icon(Icons.cloud, color: Colors.white, size: 50.0),
              const Center(child: Text("grafik", style: TextStyle(fontSize: 50),),), /// geçici
              const Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Oxygen Level"
          );
        }
      },
    );
  }
}
