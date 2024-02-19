import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution_challenge/content/app_colors.dart';
import '../pages/navigation_bar.dart';
import '../riverpod/riverpod_bottom_navigation_bar.dart';


class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  var customColors = AppColors();

  @override
  Widget build(BuildContext context) {
    var navigationWatch = ref.watch(bottomNavigationBarProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors().whiteVariety,
          appBar: AppBar(
            title: Text(
              "Health Tracker",
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
          bottomNavigationBar: CustomBottomNavigationBar(),
          body: Padding(
            padding: EdgeInsets.all(10),
              child: pageController(navigationWatch) /// pages are here
          ),
        ),
      )
    );
  }
}
