import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/gen/fonts.gen.dart';
import 'package:tec/screen/splash/splashScreen.dart';
import 'package:tec/utilities/myColors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return MaterialApp(
      theme: ThemeData(
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
          fontFamily: FontFamily.bTitr,
          textTheme: const TextTheme(
            displaySmall: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 14,
                color: SolidColors.posterSubTitle,
                fontWeight: FontWeight.w300),
            displayMedium: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 16,
                color: SolidColors.posterTitle,
                fontWeight: FontWeight.w700),
            displayLarge: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 14,
                color: SolidColors.hintText,
                fontWeight: FontWeight.w700),
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
            headlineLarge: TextStyle(
                fontFamily: FontFamily.bTitr,
                fontSize: 14,
                color: SolidColors.seeMore,
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
                color: Color.fromARGB(255, 70, 70, 70),
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
