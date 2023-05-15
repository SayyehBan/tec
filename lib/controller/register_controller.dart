import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';

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
    debugPrint(response);
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
    debugPrint(response);
    return response;
  }
}
