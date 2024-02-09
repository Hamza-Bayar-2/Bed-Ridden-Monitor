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
  @override
  Widget build(BuildContext context) {
    var navigationWatch = ref.watch(bottomNavigationBarProvider);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors().whiteVariety,
          // appBar: ,
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
