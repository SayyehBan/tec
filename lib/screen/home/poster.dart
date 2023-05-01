import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/myColors.dart';

class Poster extends StatelessWidget {
  const Poster({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
                image: AssetImage(Assets.images.programming.path),
                fit: BoxFit.fill),
          ),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                  colors: gradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'مهسا امینی - یک روز پیش',
                    style: themeData.textTheme.displaySmall,
                  ),
                  Text(
                    '253 پسندیده شد',
                    style: themeData.textTheme.displaySmall,
                  )
                ],
              ),
              Text(
                'دوازده قدم برنامه نویسی یک دوره ی...س',
                style: themeData.textTheme.displayMedium,
              )
            ],
          ),
        )
      ],
    );
  }
}
