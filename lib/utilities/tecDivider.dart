// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/utilities/myColors.dart';

class TecDivider extends StatelessWidget {
  const TecDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Divider(
      color: SolidColors.dividerColor,
      thickness: 1.5,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
