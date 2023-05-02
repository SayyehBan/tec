import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/model/data/fake_data.dart';
import 'package:tec/utilities/myColors.dart';

class PodcastsBlog extends StatelessWidget {
  const PodcastsBlog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    double bodyMargin = size.width / 10;
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? bodyMargin : 15,
                    left: index == 0 ? bodyMargin : 15),

                ///BlogItem
                child: SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(blogList[index].imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index].title,
                    style: themeData.textTheme.headlineMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ))
            ],
          );
        },
      ),
    );
  }
}
