// ignore: material
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/utilities/myColors.dart';

class TecClick extends StatelessWidget {
  const TecClick({
    super.key,
    required this.onTap,
    required this.title,
  });
  final GestureTapCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      splashColor: SolidColors.primaryColor,
      child: SizedBox(
        height: 40,
        child: Center(
          child: Text(
            title,
            style: themeData.textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
