import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';
import 'package:tec/utilities/storage_const.dart';
import 'package:tec/view/categories/myCategories.dart';

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

    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(userID, response.data['user_id']);
      debugPrint(box.read(token));
      debugPrint(box.read(userID));
      Get.to(const MyCategories());
    } else {
      debugPrint('error');
    }
  }
}
