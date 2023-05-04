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
    List<Widget> tectMainScreenPages = const [
      HomeMainScreen(),
      ProfileScreen()
    ];
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHome(),
        body: Stack(
          children: [
            Center(
                child: Positioned.fill(
                    child: tectMainScreenPages[selectedPageIndex])),
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
