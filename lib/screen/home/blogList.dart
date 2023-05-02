import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/model/data/fake_data.dart';
import 'package:tec/utilities/myColors.dart';

class BlogList extends StatelessWidget {
  const BlogList({
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
                      foregroundDecoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                              colors: gradiantColors.blogPost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            blogList[index].writer,
                            style: themeData.textTheme.displaySmall,
                          ),
                          Row(
                            children: [
                              Text(
                                blogList[index].views,
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
                    )
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
