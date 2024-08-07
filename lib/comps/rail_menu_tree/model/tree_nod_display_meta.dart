import 'package:flutter/material.dart';

import '../../model/model.dart';

class TreeNodeDisplayMeta {
  final bool selected;
  final bool hovered;
  final Brightness brightness;
  final MenuWidthType widthType;
  final double? anima;

  bool get isDark => brightness == Brightness.dark;

  double get rate => anima ?? 1;

  bool get playing => (anima ?? 0) > 0;

  TreeNodeDisplayMeta({
    required this.selected,
    required this.hovered,
    required this.brightness,
    required this.anima,
    required this.widthType,
  });
}
