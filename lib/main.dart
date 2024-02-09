import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/app/my_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      const ProviderScope(
          child: MyApp()
      ));
}
