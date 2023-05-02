import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/myColors.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: solidColors.scafoldBg,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          Assets.images.logo.image(height: size.height / 13.6),
          const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
