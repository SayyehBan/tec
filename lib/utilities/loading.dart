import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/utilities/myColors.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32,
    );
  }
}
