import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../content/app_colors.dart';
import '../riverpod/riverpod_firebase.dart';

class TemperatureBar extends ConsumerStatefulWidget {
  const TemperatureBar({Key? key}) : super(key: key);

  @override
  ConsumerState<TemperatureBar> createState() => _TemperatureBarState();
}

class _TemperatureBarState extends ConsumerState<TemperatureBar> {
  @override
  Widget build(BuildContext context) {

    return temperatureBar();
  }

  double heightResultFortemperatureBar(double num){
    double result = (37.65 * num) - 1175.2;
    print(result);

    if(num <= 33){
      return 0;
    } else if(num > 41.4){
      return 384;
    } else {
      return result;
    }
  }

  Widget temperatureBar(){
    var rivFirWatch = ref.watch(riverpodFirebase);
    var customColors = AppColors();

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const SizedBox(
              height: 400,
              child: Image(
                image: AssetImage("assets/images/temperature_bar.png"),
              ),
            ),
            Positioned(
              bottom: 10,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                height: heightResultFortemperatureBar(
                  double.parse(rivFirWatch.getTemperature())
               ),
                width: 40,
                decoration: BoxDecoration(
                  color: customColors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

