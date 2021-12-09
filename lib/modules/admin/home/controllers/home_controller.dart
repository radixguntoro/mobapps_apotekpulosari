import 'package:apotik_pulosari/modules/admin/home/models/model_home.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void setPos(index) async{
    ModelHome.setPos = index;
    update();
  }
}