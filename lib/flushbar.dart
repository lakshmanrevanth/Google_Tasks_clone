import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

class FlushBars {
  static Flushbar undo({
    required String message,
    required VoidCallback onUndo,
    required Duration duration,
  }) {
    return Flushbar(
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      icon: const Icon(Icons.timer),
      backgroundColor: Colors.black,
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: duration,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      mainButton: TextButton(
        onPressed: onUndo,
        child: const Text("undo"),
      ),
    );
  }
}
