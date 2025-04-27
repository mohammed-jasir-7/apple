

import 'dart:math';


import 'package:flutter/material.dart';

class Utils {
 static String getFileSizeString(int bytes) {
  const units = ["B", "KB", "MB", "GB", "TB"];
  double size = bytes.toDouble();
  int unitIndex = 0;

  while (size >= 1024 && unitIndex < units.length - 1) {
    size /= 1024;
    unitIndex++;
  }

  return "${size.toStringAsFixed(2)} ${units[unitIndex]}";
}
static Color getRandomAccentColor() {
  final random = Random();
  return Colors.accents[random.nextInt(Colors.accents.length)];
}
}
