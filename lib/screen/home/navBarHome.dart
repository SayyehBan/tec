import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/myColors.dart';

class NavBarHome extends StatelessWidget {
  const NavBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    double bodyMargin = size.width / 10;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: gradiantColors.bottomNavBackGround,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(right: bodyMargin, left: bodyMargin, bottom: 8),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: gradiantColors.bottomNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(Assets.icons.home.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(Assets.icons.writer.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(Assets.icons.user.path),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
