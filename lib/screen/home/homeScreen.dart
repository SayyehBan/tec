import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/screen/home/appBarHome.dart';
import 'package:tec/screen/home/blogList.dart';
import 'package:tec/screen/home/navBarHome.dart';
import 'package:tec/screen/home/podcastsBlog.dart';
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
        appBar: const AppBarHome(),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                    const BlogList(),
                    //See More
                    TitleBlog(
                      image: Assets.icons.blueMic.path,
                      title: myStrings.viewHottestPodcasts,
                    ),
                    //Podcasts Blog
                    const PodcastsBlog(),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
            const NavBarHome(),
          ],
        ),
      ),
    );
  }
}
