// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

void MessageShow(BuildContext context, String message, Color color) {
  ThemeData themeData = Theme.of(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: themeData.textTheme.headlineMedium,
    ),
    backgroundColor: color,
  ));
}
