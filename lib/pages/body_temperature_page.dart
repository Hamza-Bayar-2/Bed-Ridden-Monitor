import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../content/app_colors.dart';
import '../riverpod/riverpod_firebase.dart';
import '../widgets/main_widget_for_pages.dart';

class BodyTemperaturePage extends ConsumerStatefulWidget {
  const BodyTemperaturePage({Key? key}) : super(key: key);

  @override
  ConsumerState<BodyTemperaturePage> createState() => _BodyTemperaturePageState();
}

class _BodyTemperaturePageState extends ConsumerState<BodyTemperaturePage> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("data/temperature");
  var customColors = AppColors();

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    var rivFirRead = ref.read(riverpodFirebase);
    databaseRef.onValue.listen((event) {
      rivFirRead.changeTemperature(event.snapshot.value as int);
      print(rivFirRead.getTemperature());
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
              customColors.lightBlue,
              "Body Temperature",
              "${rivFirWatch.getTemperature()} °C",
              const Center(), /// icon olmadığı için boş
              const Center(child: Text("grafik", style: TextStyle(fontSize: 50),),), /// geçici
              Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Temperatures"
          );
        } else if(snapshot.hasError){
          return const Center(child: Text("Somthing Went Wrong", style: TextStyle(fontSize: 50),),); /// err olunca başka bişey vermeli
        } else {
          return mainWidget(
              context,
              customColors.lightBlue,
              "Body Temperature",
              "0 °C",
              const Center(), /// icon olmadığı için boş
              const Center(child: Text("grafik", style: TextStyle(fontSize: 50),),), /// geçici
              Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Temperatures"
          );
        }
      },
    );
  }
}
