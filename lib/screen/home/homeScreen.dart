import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/screen/home/blogList.dart';
import 'package:tec/screen/home/podcastsBlog.dart';
import 'package:tec/screen/home/poster.dart';
import 'package:tec/screen/home/tagList.dart';
import 'package:tec/screen/home/titleBlog.dart';
import 'package:tec/utilities/myColors.dart';
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: solidColors.scafoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Assets.images.logo.image(height: size.height / 13.6),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
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
                    const PodcastsBlog()
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: bodyMargin,
              right: bodyMargin,
              child: Container(
                height: size.height / 10,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: gradiantColors.bottomNavBackGround,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                  child: Container(
                    height: size.height / 8,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        gradient:
                            LinearGradient(colors: gradiantColors.bottomNav)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(Assets.icons.home.path),
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(Assets.icons.writer.path),
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(Assets.icons.user.path),
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
