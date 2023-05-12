// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/homeScreen_Controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/view/home/blogList.dart';
import 'package:tec/view/home/podcastsBlog.dart';
import 'package:tec/view/home/poster.dart';
import 'package:tec/view/home/tagList.dart';
import 'package:tec/view/home/titleBlog.dart';
import 'package:tec/utilities/myString.dart';
import 'package:tec/utilities/sizerScreen.dart';

class HomeMainScreen extends StatelessWidget {
  HomeMainScreen({
    super.key,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    double bodyMargin = SizeScreen(context).bodyMargin;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 16),
          child: homeScreenController.loading.value == true
              ? const Center(child: Loading())
              : Column(
                  children: [
                    Poster(),
                    const SizedBox(
                      height: 16,
                    ),

                    ///tagList
                    TagList(
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
                    BlogList(),
                    //See More
                    TitleBlog(
                      image: Assets.icons.blueMic.path,
                      title: MyStrings.viewHottestPodcasts,
                      right: bodyMargin,
                    ),
                    //Podcasts Blog
                    PodcastsBlog(),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
