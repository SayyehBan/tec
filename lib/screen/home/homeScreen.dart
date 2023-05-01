import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/model/data/fake_data.dart';
import 'package:tec/utilities/myColors.dart';

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
            Stack(
              children: [
                Container(
                  width: size.width / 1.25,
                  height: size.height / 4.2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        image: AssetImage(Assets.images.poster.path),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: size.width / 1.25,
                  height: size.height / 4.2,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                          colors: gradiantColors.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),

            ///tagList
            SizedBox(
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: tagList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 8, index == 0 ? bodyMargin : 15, 8),
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          gradient: LinearGradient(
                              colors: gradiantColors.tags,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage(Assets.icons.hashtag.path),
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              tagList[index].title,
                              style: themeData.textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
