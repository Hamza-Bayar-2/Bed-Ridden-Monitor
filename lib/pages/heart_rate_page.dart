import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution_challenge/riverpod/riverpod_firebase.dart';
import 'package:solution_challenge/widgets/main_widget_for_pages.dart';
import '../content/app_colors.dart';
import '../widgets/heart_beat_animation.dart';
import '../widgets/previous_measurements_for_pages.dart';

class HeartRatePage extends ConsumerStatefulWidget {
  const HeartRatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HeartRatePage> createState() => _HeartRatePageState();
}

class _HeartRatePageState extends ConsumerState<HeartRatePage>{
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref("data/heartRate");
  var customColors = AppColors();

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    var rivFirRead = ref.read(riverpodFirebase);
    databaseRef.onValue.listen((event) {
      // snapshot ın değeri {key: value} şeklinde olduğu için split ile ayırıp value ye ulaştım. key i kullanamadım çünkü sürekli değişiyor.
      rivFirRead.changeHeartRate(event.snapshot.value.toString());
      /// rivFirRead.changeHeartRate(event.snapshot.value.toString().split(": ").last.toString().split("}").first.toString());
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
              customColors.lightRed,
              "Heart Rate",
              "${rivFirWatch.getHeartRate()} bpm",
              BeatingHeart(heartbeatRate: double.parse(rivFirWatch.getHeartRate())),
              const Center(), /// geçici
              PreviousMeasurementsForPages(title: "Heart Rates Graphics"), /// deneme amaçlıdır
              "Previous Heart Rates"
          );
        } else if(snapshot.hasError){
          return const Center(child: Text("Somthing Went Wrong", style: TextStyle(fontSize: 50),),); /// err olunca başka bişey vermeli
        } else {
          return mainWidget(
              context,
              customColors.lightRed,
              "Heart Rate",
              "0 bpm",
              const Icon(Icons.favorite, color: Colors.red, size: 50.0),
              const Center(), /// geçici
              PreviousMeasurementsForPages(title: "Heart Rates Graphics"), /// deneme amaçlıdır
              "Previous Heart Rates"
          );
        }
      },
    );
  }
}
