import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../content/app_colors.dart';
import '../riverpod/riverpod_firebase.dart';
import '../widgets/main_widget_for_pages.dart';

class GsrSensorResultPage extends ConsumerStatefulWidget {
  const GsrSensorResultPage({Key? key}) : super(key: key);

  @override
  ConsumerState<GsrSensorResultPage> createState() => _GsrSensorResultPageState();
}

class _GsrSensorResultPageState extends ConsumerState<GsrSensorResultPage> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("data/gsr");
  var customColors = AppColors();

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    var rivFirRead = ref.read(riverpodFirebase);
    databaseRef.onValue.listen((event) {
      rivFirRead.changeGsr(event.snapshot.value.toString());
      print(event.snapshot.value);
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
              customColors.lightYellow,
              "Gsr Sensor Result",
              "${rivFirWatch.getGsr()} Ohm",
              const Center(),
              const Center(child: Text("graphic", style: TextStyle(fontSize: 50),),), /// geçici
              const Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Gsr Sensor Result"
          );
        } else if(snapshot.hasError){
          return const Center(child: Text("Somthing Went Wrong", style: TextStyle(fontSize: 50),),); /// err olunca başka bişey vermeli
        } else {
          return mainWidget(
              context,
              customColors.lightYellow,
              "Gsr Sensor Result",
              "0 Ohm",
              const Center(),
              const Center(child: Text("graphic", style: TextStyle(fontSize: 50),),), /// geçici
              const Center(child: Text("push", style: TextStyle(fontSize: 50),),), /// deneme amaçlıdır
              "Previous Gsr Sensor Result"
          );
        }
      },
    );
  }
}
