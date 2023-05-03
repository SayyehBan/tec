import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/model/data/fake_data.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/sizerScreen.dart';

class Poster extends StatelessWidget {
  const Poster({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var size = SizeScreen(context).size;
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
                image: AssetImage(homePagePosterMap["imageAssets"]),
                fit: BoxFit.fill),
          ),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                  colors: gradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " " +
                        homePagePosterMap["date"],
                    style: themeData.textTheme.displaySmall,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap['view'],
                        style: themeData.textTheme.displaySmall,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        CupertinoIcons.eye_fill,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  )
                ],
              ),
              Text(
                homePagePosterMap["title"],
                style: themeData.textTheme.displayMedium,
              )
            ],
          ),
        )
      ],
    );
  }
}
