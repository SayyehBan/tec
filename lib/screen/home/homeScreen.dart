import 'package:flutter/material.dart';
import 'package:tec/screen/home/appBarHome.dart';
import 'package:tec/screen/home/navBarHome.dart';
import 'package:tec/screen/profiler/profileScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHome(),
        body: Stack(
          children: const [
            Center(child: Positioned.fill(child: ProfileScreen())),
            NavBarHome(),
          ],
        ),
      ),
    );
  }
}
