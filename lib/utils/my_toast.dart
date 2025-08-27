import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

abstract final class MyToast {
  static void success(String message) {
    toastification.show(
      title: Text(message),
      autoCloseDuration: Duration(seconds: 5),
      style: ToastificationStyle.flat,
      type: ToastificationType.success,
      alignment: Alignment.bottomRight,
    );
  }

  static void info(String message) {
    toastification.show(
      title: Text(message),
      autoCloseDuration: Duration(seconds: 5),
      style: ToastificationStyle.flat,
      type: ToastificationType.info,
      alignment: Alignment.bottomRight,
    );
  }

  static void warning(String message) {
    toastification.show(
      title: Text(message),
      autoCloseDuration: Duration(seconds: 5),
      style: ToastificationStyle.flat,
      type: ToastificationType.warning,
      alignment: Alignment.bottomRight,
    );
  }

  static void error(String message) {
    toastification.show(
      title: Text(message),
      autoCloseDuration: Duration(seconds: 5),
      style: ToastificationStyle.flat,
      type: ToastificationType.error,
      alignment: Alignment.bottomRight,
    );
  }
}
