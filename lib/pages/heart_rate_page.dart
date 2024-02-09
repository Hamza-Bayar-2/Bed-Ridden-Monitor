import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../content/app_colors.dart';

class HeartRatePage extends ConsumerStatefulWidget {
  const HeartRatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HeartRatePage> createState() => _HeartRatePageState();
}

class _HeartRatePageState extends ConsumerState<HeartRatePage> {
  var colors = AppColors();
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('heartRate');
  var heartRate = 0;


  @override
  Widget build(BuildContext context) {

    Future getHeartRate = _databaseReference.get();
    return FutureBuilder(
      future: getHeartRate,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return heartRateUI();
        } else if(snapshot.hasError){
          return heartRateUI(); /// err olunca başka bişey vermeli
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget heartRateUI() {
    var phoneWidht = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    _databaseReference.onValue.listen((event) {
      setState(() {
        heartRate = event.snapshot.value as int;
        print(heartRate);
      });
    });
    return Center(
      child: Container(
        width: phoneWidht * 0.9,
        height: phoneHeight * 0.80,
        decoration: BoxDecoration(
            color: colors.lightRed,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: colors.darkBlue.withOpacity(0.5),
                offset: Offset(4, 4),
                blurRadius: 3,
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Heart Rate",
                    style: TextStyle(
                        color: colors.darkBlue,
                        fontSize: 35,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "Last Measurement",
                    style: TextStyle(
                      color: colors.darkBlue,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Image(image: AssetImage("")),
                  Text(
                    "${heartRate} bpm",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Text(
                "grafik",
                style: TextStyle(
                    fontSize: 50
                ),
              ),
              GestureDetector(
                onTap: () {
                  _databaseReference.set(92); /// deneme amacli
                },
                child: const Text(
                  "Previous Heart Rates",
                  style: TextStyle(
                    decoration: TextDecoration.underline,

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
