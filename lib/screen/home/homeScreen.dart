import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/screen/home/blogList.dart';
import 'package:tec/screen/home/poster.dart';
import 'package:tec/screen/home/tagList.dart';
import 'package:tec/screen/home/titleBlog.dart';
import 'package:tec/utilities/myString.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            //appBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.menu),
                Assets.images.logo.image(height: size.height / 13.6),
                const Icon(Icons.search),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Poster(),
            const SizedBox(
              height: 16,
            ),

            ///tagList
            const TagList(),
            const SizedBox(
              height: 32,
            ),
            //See More
            TitleBlog(
              image: Assets.icons.bluePen.path,
              title: myStrings.viewHottestPosts,
            ),
            //Blog List
            const BlogList()
          ],
        ),
      )),
    );
  }
}
