import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyTemperaturePage extends ConsumerStatefulWidget {
  const BodyTemperaturePage({Key? key}) : super(key: key);

  @override
  ConsumerState<BodyTemperaturePage> createState() => _BodyTemperaturePageState();
}

class _BodyTemperaturePageState extends ConsumerState<BodyTemperaturePage> {
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Text("         BODY \n TEMPERATURE"),
      );
  }
}
