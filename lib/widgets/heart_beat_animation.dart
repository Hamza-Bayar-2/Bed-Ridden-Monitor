import 'package:flutter/material.dart';

class BeatingHeart extends StatefulWidget {
  final int heartbeatRate;

  BeatingHeart({Key? key, required this.heartbeatRate}) : super(key: key);

  @override
  _BeatingHeartState createState() => _BeatingHeartState();
}

class _BeatingHeartState extends State<BeatingHeart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 30000 ~/ (widget.heartbeatRate)),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
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
}

