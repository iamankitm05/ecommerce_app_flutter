import 'package:flutter/foundation.dart';

abstract final class AppLogger {
  static void success(String message, [Exception? e]) {
    if (kDebugMode) {
      print('\x1B[32mSuccess: $message\x1B[0m');
    }
  }

  static void info(String message, [Exception? e]) {
    if (kDebugMode) {
      print('\x1B[35mInfo: $message\x1B[0m');
    }
  }

  static void error(String message, [Exception? e]) {
    if (kDebugMode) {
      print('\x1B[31mError: $message\x1B[0m');
      if (e != null) {
        print('\x1B[31mStack Traces: $e\x1B[0m');
      }
    }
  }

  static void warning(String message, [Exception? e]) {
    if (kDebugMode) {
      print('\x1B[33mWarning: $message\x1B[0m');
      if (e != null) {
        print('\x1B[33mStack Traces: $e\x1B[0m');
      }
    }
  }
}
