// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SizeScreen {
  final BuildContext context;
  final Size size;
  final double bodyMargin;

  SizeScreen(this.context, {double bodyMargin = 0.0})
      : size = MediaQuery.of(context).size,
        bodyMargin = bodyMargin == 0
            ? MediaQuery.of(context).size.width / 10
            : bodyMargin;

  factory SizeScreen.fromContext(BuildContext context) {
    return SizeScreen(context);
  }

  SizeScreen withMargin(double margin) {
    return SizeScreen(context, bodyMargin: margin);
  }
}
