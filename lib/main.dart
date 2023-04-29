import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/gen/fonts.gen.dart';
import 'package:tec/screen/home/homeScreen.dart';
import 'package:tec/screen/splash/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: FontFamily.bTitr,
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w300),
            headlineMedium: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700),
            bodySmall: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 13,
                fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.w700),
            bodyLarge: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 14,
                color: Colors.red,
                fontWeight: FontWeight.w700),
          )),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      home: const SplashScreen(),
    );
  }
}
