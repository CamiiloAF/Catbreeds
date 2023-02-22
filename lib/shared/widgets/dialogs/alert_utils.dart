import 'package:flutter/material.dart';

import '../../../main.dart';

abstract class AlertUtils {
  static void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(navigatorKey.currentState!.context)
        .showSnackBar(snackBar);
  }
}
