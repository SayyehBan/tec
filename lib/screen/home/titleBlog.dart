import 'package:flutter/material.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/sizerScreen.dart';

class TitleBlog extends StatelessWidget {
  const TitleBlog({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double bodyMargin = SizeScreen(context).bodyMargin;
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(image),
            color: solidColors.seeMore,
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
