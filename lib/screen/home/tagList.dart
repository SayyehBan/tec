// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/model/data/fake_data.dart';
import 'package:tec/screen/categories/mainTagList.dart';
import 'package:tec/utilities/sizerScreen.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
    required this.scrollDirection,
  });
  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    double bodyMargin = SizeScreen(context).bodyMargin;
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: scrollDirection,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTagList(index: index));
        },
      ),
    );
  }
}
