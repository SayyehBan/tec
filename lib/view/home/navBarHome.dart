// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/dimens.dart';
import 'package:tec/utilities/myColors.dart';

class NavBarHome extends StatelessWidget {
  const NavBarHome({
    super.key,
    required this.changePage,
  });
  final Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      left: 0,
      right: 0,
      child: Container(
        height: Get.size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradiantColors.bottomNavBackGround,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: Dimens.bodyMargin,
            left: Dimens.bodyMargin,
          ),
          child: Container(
            height: Get.size.height / Dimens.small,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradiantColors.bottomNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => changePage(0),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.home.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Get.find<RegisterController>().toggleLogin();
                    },
                    icon: ImageIcon(
                      AssetImage(Assets.icons.write.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () => changePage(1),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.user.path),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
