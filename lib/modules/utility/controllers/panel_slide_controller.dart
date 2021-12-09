import 'package:get/get.dart';

class PanelSlideController extends GetxController {
  bool isFull = false;

  void setPanelHeight(pos) async{
    isFull = pos > 0 ? true : false;
    update();
  }
}