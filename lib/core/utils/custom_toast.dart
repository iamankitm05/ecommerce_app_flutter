import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract final class CustomToast {
  static void success({required String message}) {
    toastification.show(
      title: Text(message),
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: Duration(seconds: 3),
    );
  }

  static void info({required String message}) {
    toastification.show(
      title: Text(message),
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: Duration(seconds: 3),
    );
  }

  static void warning({required String message}) {
    toastification.show(
      title: Text(message),
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: Duration(seconds: 3),
    );
  }

  static void error({required String message}) {
    toastification.show(
      title: Text(message),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: Duration(seconds: 3),
    );
  }
}
