import 'package:flutter/material.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/sizerScreen.dart';

class TecDivider extends StatelessWidget {
  const TecDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = SizeScreen(context).size;
    return Divider(
      color: solidColors.dividerColor,
      thickness: 1.5,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
