import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isLightMode=> Theme.of(this).brightness==Brightness.light;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
