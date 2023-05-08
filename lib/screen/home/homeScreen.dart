// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/screen/home/appBarHome.dart';
import 'package:tec/screen/home/homeMainScreen.dart';
import 'package:tec/screen/home/navBarHome.dart';
import 'package:tec/screen/profiler/profileScreen.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/sizerScreen.dart';
import 'package:tec/utilities/tecClick.dart';
import 'package:tec/utilities/tecDivider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = SizeScreen(context).size;
    return SafeArea(
      child: Scaffold(
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
                child: IndexedStack(
              index: selectedPageIndex,
              children: const [HomeMainScreen(), ProfileScreen()],
            )),
            NavBarHome(
              changePage: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
