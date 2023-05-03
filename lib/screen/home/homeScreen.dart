import 'package:flutter/material.dart';
import 'package:tec/screen/home/appBarHome.dart';
import 'package:tec/screen/home/homeMainScreen.dart';
import 'package:tec/screen/home/navBarHome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHome(),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: const HomeMainScreen(),
            ),
            const NavBarHome(),
          ],
        ),
      ),
    );
  }
}
