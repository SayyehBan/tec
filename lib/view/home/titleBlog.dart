// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleBlog extends StatelessWidget {
  const TitleBlog(
      {super.key,
      required this.image,
      required this.title,
      required this.right,
      required this.color});
  final String image;
  final String title;
  final double right;
  final Color color;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(right: right, bottom: 0),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(image),
            color: color,
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
              width: Get.width / 1.5,
              child: Text(title,
                  style: themeData.textTheme.headlineLarge
                      ?.copyWith(color: color)))
        ],
      ),
    );
  }
}
