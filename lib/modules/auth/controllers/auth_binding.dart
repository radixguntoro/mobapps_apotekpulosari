import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ModelAuth>(ModelAuth(), permanent: true);
  }
}