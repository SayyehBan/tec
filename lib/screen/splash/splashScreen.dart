import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/screen/home/homeScreen.dart';
import 'package:tec/utilities/myColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.logo.image(height: 64),
                const SizedBox(
                  height: 32,
                ),
                const SpinKitFadingCube(
                  color: solidColors.primaryColor,
                  size: 32.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
