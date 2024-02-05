
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationBarProvider = StateProvider<int>(
  (ref) {
    int index = 0;
    return index;
  }
);
