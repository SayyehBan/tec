// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tec/screen/home/appBarHome.dart';
import 'package:tec/screen/home/homeMainScreen.dart';
import 'package:tec/screen/home/navBarHome.dart';
import 'package:tec/screen/profiler/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
