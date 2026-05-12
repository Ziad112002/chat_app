import 'package:flutter/material.dart';

extension DoubleExtension on double {
  SizedBox verticalSpace() => SizedBox(
        height: this,
      );

  SizedBox horizontalSpace() => SizedBox(
        width: this,
      );
}
