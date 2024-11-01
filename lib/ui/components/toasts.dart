import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showNormalToast({required BuildContext context, required String message}) {
  Fluttertoast.showToast(msg: message);
}

void showSuccessToast(
    {required BuildContext context, required String message}) {
  Fluttertoast.showToast(
      msg: message, backgroundColor: Theme.of(context).colorScheme.surface);
}

void showErrorToast({required BuildContext context, required String message}) {
  Fluttertoast.showToast(
      msg: message, backgroundColor: Theme.of(context).colorScheme.error);
}

void showWarningToast(
    {required BuildContext context, required String message}) {
  Fluttertoast.showToast(
      msg: message, backgroundColor: Theme.of(context).colorScheme.tertiary);
}
