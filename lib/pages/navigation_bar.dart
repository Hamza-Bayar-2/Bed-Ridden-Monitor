import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solution_challenge/content/app_colors.dart';
import '../riverpod/riverpod_bottom_navigation_bar.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends ConsumerState<CustomBottomNavigationBar> {
  var colors = AppColors();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: colors.darkBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            iconButton(0, "assets/icons/filled_heart.png", "assets/icons/heart.png"),
            iconButton(1, "assets/icons/filled_tempareture.png", "assets/icons/tempareture.png"),
            iconButton(2, "assets/icons/filled_oxygen.png", "assets/icons/oxygen.png"),
            iconButton(3, "assets/icons/happy.png", "assets/icons/happy_light.png"),
            iconButton(4, "assets/icons/filled_speed.png", "assets/icons/speed.png"),
            /// iconButton(5, "assets/icons/filled_setting.png", "assets/icons/setting.png"),
          ],
        ),
      ),
    );
  }

  Widget iconButton(int selectedPageIndex, String activeIcon, String passiveIcon){
    var navigationWatch = ref.watch(bottomNavigationBarProvider);
    var navigationRead = ref.read(bottomNavigationBarProvider.notifier);
    return GestureDetector(
      onTap: () {
        navigationRead.state = selectedPageIndex;
      },
      child: SizedBox(
        height: 42,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(
                navigationWatch == selectedPageIndex ? activeIcon : passiveIcon
              ),
            )
          ],
        ),
      ),
    );
  }
}
