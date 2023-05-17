import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/main.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';
import 'package:tec/utilities/storage_const.dart';
import 'package:tec/view/home/homeScreen.dart';
import 'package:tec/view/register/registerIntro.dart';

class RegisterController extends GetxController {
  TextEditingController emialTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController =
      TextEditingController();

  register() async {
    Map<String, dynamic> map = {
      'email': emialTextEditingController.text,
      'command': 'register'
    };
    var response =
        await DioService().postMethod(map, ApiUrlConstant.postRegister);
    return response;
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': emialTextEditingController.text,
      'code': activeCodeTextEditingController.text,
      'user_id': 158,
      'command': 'verify'
    };
    var response =
        await DioService().postMethod(map, ApiUrlConstant.postRegister);
    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userID, response.data['user_id']);
        debugPrint(box.read(token));
        debugPrint(box.read(userID));
        Get.offAll(HomeScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کدفعال سازی درست نیست');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کدفعال سازی منقضی شده است');
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.images.tcbot,
                height: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'دونسته هات رو با بقیه به اشتراک بذار ...',
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            '''فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..''',
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(NamedRoute.routeManageArticles);
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.writeArticle.path,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'مدیریت مقاله ها',
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint("مدیرییت پادکست");
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.writePodcastIcon.path,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'مدیریت پادکست ها',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
