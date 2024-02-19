import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution_challenge/content/app_colors.dart';
import '../riverpod/riverpod_bottom_navigation_bar.dart';


class PreviousMeasurementsForPages extends ConsumerStatefulWidget {
  String title;
  PreviousMeasurementsForPages({Key? key, required this.title}) : super(key: key);

  @override
  ConsumerState<PreviousMeasurementsForPages> createState() => PreviousMeasurementsForPagesState();
}

class PreviousMeasurementsForPagesState extends ConsumerState<PreviousMeasurementsForPages> {
  var customColors = AppColors();

  @override
  Widget build(BuildContext context) {
    var navigationWatch = ref.watch(bottomNavigationBarProvider);
    var phoneWidht = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().whiteVariety,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: customColors.whiteVariety
          ),
        ),
        backgroundColor: customColors.darkBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12)
          )
        ),
      ),
      body: Center()
    );
  }
}
