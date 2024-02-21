import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../content/app_colors.dart';
import '../riverpod/riverpod_firebase.dart';
import '../widgets/main_widget_for_pages.dart';
import '../widgets/previous_measurements_for_pages.dart';

class VelocityResultsPage extends ConsumerStatefulWidget {
  const VelocityResultsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<VelocityResultsPage> createState() => _AccelerationResultsStatePage();
}

class _AccelerationResultsStatePage extends ConsumerState<VelocityResultsPage> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("Sensors/Gyro");
  final DatabaseReference databaseRefX = FirebaseDatabase.instance.ref("Sensors/Gyro/gx");
  final DatabaseReference databaseRefY = FirebaseDatabase.instance.ref("Sensors/Gyro/gy");
  final DatabaseReference databaseRefZ = FirebaseDatabase.instance.ref("Sensors/Gyro/gz");
  var customColors = AppColors();

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    var rivFirRead = ref.read(riverpodFirebase);
    databaseRefX.onValue.listen((event) {
      rivFirRead.changeVelocityX(event.snapshot.value.toString());
      print(rivFirRead.getVelocityX());
    });

    databaseRefY.onValue.listen((event) {
      rivFirRead.changeVelocityY(event.snapshot.value.toString());
      print(rivFirRead.getVelocityY());
    });

    databaseRefZ.onValue.listen((event) {
      rivFirRead.changeVelocityZ(event.snapshot.value.toString());
      print(rivFirRead.getVelocityZ());
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
              "Velocity Result",
              "gx = ${rivFirWatch.getVelocityX()}\ngy = ${rivFirWatch.getVelocityY()}\ngz = ${rivFirWatch.getVelocityZ()}",
              const Center(),
              const Center(), /// geçici
              PreviousMeasurementsForPages(title: "Velocity Graphics"), /// deneme amaçlıdır
              "Previous Velocity Result"
          );
        } else if(snapshot.hasError){
          return const Center(child: Text("Somthing Went Wrong", style: TextStyle(fontSize: 50),),); /// err olunca başka bişey vermeli
        } else {
          return mainWidget(
              context,
              customColors.lightOrange,
              "Velocity Result",
              "0",
              const Center(),
              const Center(child: Text("graphic", style: TextStyle(fontSize: 50),),), /// geçici
              PreviousMeasurementsForPages(title: "Velocity Graphics"), /// deneme amaçlıdır
              "Previous Velocity Result"
          );
        }
      },
    );
  }
}
