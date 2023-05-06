import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/myString.dart';
import 'package:tec/utilities/sizerScreen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var size = SizeScreen(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            Assets.icons.tecbot,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: myStrings.welcome,
                  style: themeData.textTheme.headlineMedium),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return solidColors.seeMore;
                  }
                  return solidColors.primaryColor;
                }),
                textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return themeData.textTheme.headlineMedium;
                  }
                  return themeData.textTheme.headlineMedium;
                }),
              ),
              child: const Text(
                'بزن بریم',
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
