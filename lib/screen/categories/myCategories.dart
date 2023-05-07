// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/myString.dart';
import 'package:tec/utilities/sizerScreen.dart';

class MyCategories extends StatelessWidget {
  const MyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var size = SizeScreen(context).size;
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
                ]),
          ),
        ),
      ),
    ));
  }
}
