// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/utilities/myColors.dart';

class TitleBlog extends StatelessWidget {
  const TitleBlog(
      {super.key,
      required this.image,
      required this.title,
      required this.right});
  final String image;
  final String title;
  final double right;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(right: right, bottom: 0),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(image),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(title, style: themeData.textTheme.headlineLarge)
        ],
      ),
    );
  }
}
