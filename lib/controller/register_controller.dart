import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
      Get.offAll(HomeScreen());
    }
  }
}
