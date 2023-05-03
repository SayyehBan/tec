import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/screen/home/titleBlog.dart';
import 'package:tec/utilities/tecClick.dart';
import 'package:tec/utilities/tecDivider.dart';
import 'package:tec/utilities/myString.dart';
import 'package:tec/utilities/sizerScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var size = SizeScreen(context).size;
    double bodyMargin = SizeScreen(context).bodyMargin;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.avatar.image(height: 100),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleBlog(
                image: Assets.icons.bluePen.path,
                title: myStrings.editProfilePicture,
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
            title: myStrings.myFavoriteArticles,
          ),
          const TecDivider(),
          TecClick(
            onTap: () {},
            title: myStrings.myFavoritePodcasts,
          ),
          const TecDivider(),
          TecClick(
            onTap: () {},
            title: myStrings.logOut,
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
