import 'package:flutter/widgets.dart';
import 'package:tec/utilities/myColors.dart';

class MyDecorations {
  MyDecorations._();
  static BoxDecoration mainGradiant = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      gradient: LinearGradient(colors: GradiantColors.bottomNav));
}
