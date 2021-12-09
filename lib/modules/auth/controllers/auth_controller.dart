import 'package:apotik_pulosari/components/snackbar/snackbar.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/auth/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GetStorage box = GetStorage();
  String username;
  String password;
  String personsId;
  String authStatus;
  bool isLoading = false;
  bool isEmptyForm = false;

  AuthController({
    this.username,
    this.personsId,
    this.password,
  });

  void isLoadingTrue() {
    ModelAuth.isEnable = false;
    ModelAuth.isLoading = true;
  }

  void isLoadingFalse() {
    ModelAuth.isEnable = true;
    ModelAuth.isLoading = false;
  }

  void signIn() async {
    if (ModelAuth.username == '' || ModelAuth.username == null) {
      isEmptyForm = true;
      update();
    } else {
      isLoading = true;
      update();
      try {
        var resp = await AuthService.signIn(ModelAuth.username, ModelAuth.password);
        if (resp == 'success') {
          authStatus = 'loggedIn';
          isLoading = false;
          update();
        } else {
          Snackbar.inactive();
          isLoading = false;
          update();
        }
      } catch (e) {
        Get.snackbar(
          "Error signing in",
          e.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  // void GooglesignIn() async {
  //   isLoadingTrue();
  //   update();
  //   try {
  //     var resp = await AuthService.signInWithGoogle();
  //     print("ini hasilny $resp");
  //     if (resp == 'success') {
  //       authStatus = 'loggedIn';
  //       isLoadingFalse();
  //       update();
  //     }
  //   } catch (e) {
  //     isLoadingFalse();
  //     Get.snackbar(
  //       "Error signing in",
  //       e.message,
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }

  void signOut() async {
    isLoadingTrue();
    update();
    authStatus = await AuthService.signOut();
    ModelAuth.username = null;
    ModelAuth.password = null;
    ModelAuth.permission = null;
    ModelAuth.personsId = null;
    ModelAuth.isLoading = false;
    box.erase();
    isLoadingFalse();
    update();
  }
}
