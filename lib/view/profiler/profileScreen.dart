// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/home/titleBlog.dart';
import 'package:tec/utilities/tecClick.dart';
import 'package:tec/utilities/tecDivider.dart';
import 'package:tec/utilities/myString.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.profileAvatar.image(height: 100),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleBlog(
                  image: Assets.icons.bluePen.path,
                  title: MyStrings.editProfilePicture,
                  right: 0,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              'نیکا شاکرمی',
              style: themeData.textTheme.headlineMedium,
            ),
            Text(
              'NikaShakarami@gmail.com',
              style: themeData.textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            const TecDivider(),
            TecClick(
              onTap: () {},
              title: MyStrings.myFavoriteArticles,
            ),
            const TecDivider(),
            TecClick(
              onTap: () {},
              title: MyStrings.myFavoritePodcasts,
            ),
            const TecDivider(),
            TecClick(
              onTap: () {},
              title: MyStrings.logOut,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
