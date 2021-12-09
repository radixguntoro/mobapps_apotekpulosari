import 'package:get/state_manager.dart';


class FormController extends GetxController {
  static bool isObscure = true;

  void textObscure(isObscure) {
    FormController.isObscure = isObscure;
    update();
  }
}