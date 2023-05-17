import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/binding/binding.dart';
import 'package:tec/gen/fonts.gen.dart';
import 'package:tec/my_http_overrides.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/view/home/homeScreen.dart';
import 'package:tec/view/singleScreen/singleScreen.dart';
import 'package:tec/view/splash/splashScreen.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GetMaterialApp(
      locale: const Locale('fa'),
      theme: lightTheme(themeData),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: routeHomeScreen,
            page: () => HomeScreen(),
            binding: RegisterBinding()),
        GetPage(
            name: routSingleScreen,
            page: () => SingleScreen(),
            binding: ArticleBinding()),
      ],
      home: const SplashScreen(),
    );
  }

  ThemeData lightTheme(ThemeData themeData) {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2),
            ),
            filled: true,
            fillColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primaryColor;
            }),
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return themeData.textTheme.headlineMedium;
              }
              return themeData.textTheme.bodyLarge;
            }),
          ),
        ),
        fontFamily: FontFamily.dana,
        textTheme: const TextTheme(
          displaySmall: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 14,
              color: SolidColors.posterSubTitle,
              fontWeight: FontWeight.w300),
          displayMedium: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 16,
              color: SolidColors.posterTitle,
              fontWeight: FontWeight.w700),
          displayLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 14,
              color: SolidColors.hintText,
              fontWeight: FontWeight.w700),
          headlineSmall: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300),
          headlineMedium: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700),
          headlineLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 14,
              color: SolidColors.seeMore,
              fontWeight: FontWeight.w700),
          bodySmall: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 13,
              fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 14,
              color: Color.fromARGB(255, 70, 70, 70),
              fontWeight: FontWeight.w700),
        ));
  }
}

String routeHomeScreen = "/HomeScreen";
String routSingleScreen = "/SingleScreen";
