import 'package:flutter/material.dart';

abstract class AppPalette {
  static const red = Colors.red;
  static const imperialRed = Color(0xFFE54B4B);

  static const seashell = Color(0xFFF7EBE8);

  static const grey = _GreyColors();
}

class _GreyColors {
  const _GreyColors();
  final grey50 = const Color(0xFFFAFAFA);
  final grey100 = const Color(0xFFF5F5F5);
}
