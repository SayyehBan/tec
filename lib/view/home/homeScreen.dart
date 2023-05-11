// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/home/appBarHome.dart';
import 'package:tec/view/home/homeMainScreen.dart';
import 'package:tec/view/home/navBarHome.dart';
import 'package:tec/view/profiler/profileScreen.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/sizerScreen.dart';
import 'package:tec/utilities/tecClick.dart';
import 'package:tec/utilities/tecDivider.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  RxInt selectedPageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    var size = SizeScreen(context).size;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: ListView(children: [
            DrawerHeader(
                child: Center(
              child: Assets.images.logo.image(height: size.height / 13.6),
            )),
            TecClick(onTap: () {}, title: "پروفایل کاربری"),
            const TecDivider(),
            TecClick(onTap: () {}, title: "درباره تک‌بلاگ"),
            const TecDivider(),
            TecClick(onTap: () {}, title: "اشتراک گذاری تک بلاگ"),
            const TecDivider(),
            TecClick(onTap: () {}, title: "تک‌بلاگ در گیت هاب"),
          ]),
        ),
        appBar: const AppBarHome(),
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(() => IndexedStack(
                    index: selectedPageIndex.value,
                    children: const [HomeMainScreen(), ProfileScreen()],
                  )),
            ),
            NavBarHome(
              changePage: (int value) {
                selectedPageIndex.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
