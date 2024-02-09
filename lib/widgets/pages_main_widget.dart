import 'package:flutter/cupertino.dart';
import 'package:solution_challenge/content/app_colors.dart';

Widget PagesWidget(BuildContext context, String header, int measurement, Widget graphic, Widget previousMeasurementPage, String pushedPageName){
  var colors = AppColors();
  var phoneWidht = MediaQuery.of(context).size.width;
  var phoneHeight = MediaQuery.of(context).size.height;
  return Container(
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
                "87 bpm",
                style: TextStyle(
                  fontSize: 30,
                ),
              )
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
  );
}