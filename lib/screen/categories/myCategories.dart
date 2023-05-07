// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/model/data/fake_data.dart';
import 'package:tec/model/model/data_models.dart';
import 'package:tec/screen/categories/mainTagList.dart';
import 'package:tec/utilities/myString.dart';
import 'package:tec/utilities/sizerScreen.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    // var size = SizeScreen(context).size;
    var bodyMargin = SizeScreen(context).bodyMargin;
    ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.icons.tecbot,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    MyStrings.congratulations,
                    style: themeData.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "نام و نام خانوادگی",
                        alignLabelWithHint: true,
                        hintStyle: themeData.textTheme.displayLarge),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyStrings.chooseCag,
                    style: themeData.textTheme.bodyLarge,
                  ),
                  //taglist
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                        width: double.infinity,
                        height: 85,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: tagList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.3),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    HashTagModel(title: tagList[index].title);
                                  });
                                },
                                child: MainTagList(index: index));
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Assets.images.downCatArrow.image(scale: 3),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                        width: double.infinity,
                        height: 85,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: tagList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.3),
                          itemBuilder: (context, index) {
                            return MainTagList(index: index);
                          },
                        )),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
