import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../content/app_colors.dart';
import '../riverpod/riverpod_firebase.dart';
import '../widgets/main_widget_for_pages.dart';
import '../widgets/previous_measurements_for_pages.dart';

class OxygenLevelPage extends ConsumerStatefulWidget {
  const OxygenLevelPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OxygenLevelPage> createState() => _OxygenLevelPageState();
}

class _OxygenLevelPageState extends ConsumerState<OxygenLevelPage> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("Sensors/Oxy/SpO2");
  var customColors = AppColors();

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    var rivFirRead = ref.read(riverpodFirebase);
    databaseRef.onValue.listen((event) {
      rivFirRead.changeOxygen(event.snapshot.value.toString());
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
              const SizedBox(height: 50, child: Image(image: AssetImage("assets/icons/oxygen2.png"))),
              const Center(), /// geçici
              PreviousMeasurementsForPages(title: "Oxygen Level Graphics"), /// deneme amaçlıdır
              "Previous Oxygen Level"
          );
        } else if(snapshot.hasError){
          return Center(
            child: Text(
              "Somthing Went Wrong\n\n${snapshot.error.toString().split("]").last}",
              style: const TextStyle(
                  fontSize: 30
              ),
            ),
          ); /// err olunca başka bişey vermeli
        } else {
          return mainWidget(
              context,
              customColors.lightGreen,
              "Oxygen Level",
              "0",
              const Icon(Icons.cloud, color: Colors.white, size: 50.0),
              const Center(), /// geçici
              PreviousMeasurementsForPages(title: "Oxygen Level Graphics"), /// deneme amaçlıdır
              "Previous Oxygen Level"
          );
        }
      },
    );
  }
}
