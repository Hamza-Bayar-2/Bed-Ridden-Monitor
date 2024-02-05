import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeartRatePage extends ConsumerStatefulWidget {
  const HeartRatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HeartRatePage> createState() => _HeartRatePageState();
}

class _HeartRatePageState extends ConsumerState<HeartRatePage> {
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Text("HEART \n RATE"),
      );
  }
}
