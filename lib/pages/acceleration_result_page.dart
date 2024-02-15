import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../content/app_colors.dart';
import '../riverpod/riverpod_firebase.dart';
import '../widgets/main_widget_for_pages.dart';

class AccelerationResultsPage extends ConsumerStatefulWidget {
  const AccelerationResultsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AccelerationResultsPage> createState() => _AccelerationResultsStatePage();
}

class _AccelerationResultsStatePage extends ConsumerState<AccelerationResultsPage> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("data/acceleration");
  var customColors = AppColors();

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    var rivFirRead = ref.read(riverpodFirebase);
    databaseRef.onValue.listen((event) {
      rivFirRead.changeAcceleration(event.snapshot.value as int);
      print(rivFirRead.getAcceleration());
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
              customColors.lightOrange,
              "Acceleration Result",
              "${rivFirWatch.getAcceleration()} m/s",
              const Center(),
              const Center(child: Text("grafik", style: TextStyle(fontSize: 50),),), /// geçici
              const Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Acceleration Result"
          );
        } else if(snapshot.hasError){
          return const Center(child: Text("Somthing Went Wrong", style: TextStyle(fontSize: 50),),); /// err olunca başka bişey vermeli
        } else {
          return mainWidget(
              context,
              customColors.lightOrange,
              "Acceleration Result",
              "0",
              const Center(),
              const Center(child: Text("grafik", style: TextStyle(fontSize: 50),),), /// geçici
              const Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Acceleration Result"
          );
        }
      },
    );
  }
}
