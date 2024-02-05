import 'package:flutter/material.dart';
import 'package:solution_challenge/app/my_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
      ProviderScope(
          child: MyApp()
      ));
}
