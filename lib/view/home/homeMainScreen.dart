// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/home/blogList.dart';
import 'package:tec/view/home/podcastsBlog.dart';
import 'package:tec/view/home/poster.dart';
import 'package:tec/view/home/tagList.dart';
import 'package:tec/view/home/titleBlog.dart';
import 'package:tec/utilities/myString.dart';
import 'package:tec/utilities/sizerScreen.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double bodyMargin = SizeScreen(context).bodyMargin;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            const Poster(),
            const SizedBox(
              height: 16,
            ),

            ///tagList
            const TagList(
              scrollDirection: Axis.horizontal,
            ),
            const SizedBox(
              height: 32,
            ),
            //See More
            TitleBlog(
              image: Assets.icons.bluePen.path,
              title: MyStrings.viewHottestPosts,
              right: bodyMargin,
            ),
            //Blog List
            const BlogList(),
            //See More
            TitleBlog(
              image: Assets.icons.blueMic.path,
              title: MyStrings.viewHottestPodcasts,
              right: bodyMargin,
            ),
            //Podcasts Blog
            const PodcastsBlog(),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
