// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/textStyle.dart';

class AppBarList extends StatelessWidget {
  const AppBarList({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: Text(
                  title,
                  style: appBarTextStyle,
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: SolidColors.primaryColor.withBlue(100),
                  shape: BoxShape.circle),
              child: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
