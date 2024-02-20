import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/riverpod_firebase.dart';

class BeatingHeart extends ConsumerStatefulWidget {
  double heartbeatRate;

  BeatingHeart({Key? key, required this.heartbeatRate}) : super(key: key);

  @override
  ConsumerState<BeatingHeart> createState() => _BeatingHeartState();
}

class _BeatingHeartState extends ConsumerState<BeatingHeart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      /// init yaparken watch kullanamıyoruz o yüzden ilk değeri class ın çağrıldığ yerden aldık
      duration: Duration(milliseconds: 30000 ~/ (widget.heartbeatRate <= 0 ? 1 : widget.heartbeatRate)),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    var rivFirWatch = ref.watch(riverpodFirebase);
    double heartRate = double.parse(rivFirWatch.getHeartRate());
    int milliSec;
    if(heartRate <= 0){
      milliSec = 1;
    } else {
      // kalp git gel yaptığı için 60000 yerine 30000, yani yarısını aldık
      milliSec = 30000 ~/ heartRate;
    }

    Duration newDuration = Duration(milliseconds: milliSec);
    if (_animationController.duration != newDuration) {
      _animationController.duration = newDuration;
      _animationController.repeat(reverse: true);
    }

    return SizedBox(
      height: 60,
      width: 60,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Icon(
            Icons.favorite,
            color: Colors.red,
            size: 50.0 + _animationController.value * 5.0,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

