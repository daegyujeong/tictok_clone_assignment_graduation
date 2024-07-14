import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  String errorMessage = "Something went wrong.";
  if (error is FirebaseException) {
    errorMessage = error.message ?? errorMessage;
  } else if (error is TypeError) {
    errorMessage = "Type error: ${error.toString()}";
  } else if (error is Exception) {
    errorMessage = "Exception: ${error.toString()}";
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(errorMessage),
    ),
  );
}
