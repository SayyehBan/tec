// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/myString.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});
  var registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            Assets.images.tcbot,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: MyStrings.welcome,
                  style: themeData.textTheme.headlineMedium),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, Get.size, themeData);
              },
              child: const Text(
                'بزن بریم',
              ),
            ),
          ),
        ]),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, ThemeData themeData) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.insertYourEmail,
                  style: themeData.textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    controller: registerController.emialTextEditingController,
                    onChanged: (value) {
                      // print(isEmail(value));
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "tecBlog@gmail.com",
                        hintStyle: themeData.textTheme.displayLarge),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (isEmail(registerController
                              .emialTextEditingController.text) ==
                          true) {
                        registerController.register();
                        Navigator.pop(context);
                        _showActiveCodeBottomSheet(context, size, themeData);
                      } else {
                        Get.snackbar('خطا', 'ایمیل معتبر نیست');
                      }
                    },
                    child: const Text("ادامه"))
              ],
            )),
          ),
        );
      },
    );
  }

  Future<dynamic> _showActiveCodeBottomSheet(
      BuildContext context, Size size, ThemeData themeData) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.activeCode,
                  style: themeData.textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    controller:
                        registerController.activeCodeTextEditingController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "*****",
                        hintStyle: themeData.textTheme.displayLarge),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      registerController.verify();
                    },
                    child: const Text("ادامه"))
              ],
            )),
          ),
        );
      },
    );
  }
}
