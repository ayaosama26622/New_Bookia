import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle body = TextStyle(fontSize: 16);
  static const TextStyle text = TextStyle(fontSize: 14);
  static const TextStyle caption = TextStyle(fontSize: 12);
}
