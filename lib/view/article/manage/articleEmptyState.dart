// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/myString.dart';

class ArticleEmptyState extends StatelessWidget {
  const ArticleEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          Assets.images.emptyState.path,
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: MyStrings.articleEmpty,
                style: themeData.textTheme.headlineMedium),
          ),
        ),
      ]),
    );
  }
}
