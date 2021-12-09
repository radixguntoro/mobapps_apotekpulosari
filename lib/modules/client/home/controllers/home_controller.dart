import 'package:apotik_pulosari/modules/client/home/models/model_home.dart';
import 'package:apotik_pulosari/modules/client/home/services/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<dynamic> dataMedicines = [];
  bool isLoadingMedicines = true;
  int page = 1;
  int limit = 20;
  int currentPage;
  int lastPage;
  int totalData = 0;
  bool maxData = false;

  @override
  void onInit() {}

  void readMedicineFirst() async{
    isLoadingMedicines = true;
    update();
    page = 1;
    ModelHome.maxData = false;
    var resp = await HomeService.readMedicine(page, limit);
    dataMedicines = resp['data'];
    totalData = resp['total'];
    currentPage = resp['current_page'];
    isLoadingMedicines = false;
    update();
  }

  void readMedicineMore() async{
    page = currentPage + 1;
    var resp = await HomeService.readMedicine(page, limit);
    if (resp['data'].isEmpty) {
      maxData = true;
    } else {
      maxData = false;
      dataMedicines += resp['data'];
      currentPage = resp['current_page'];
    }
    update();
  }

  void readMedicineBySearch(type) async{
    var resp = await HomeService.readMedicineBySearch(type, page, limit);
    dataMedicines = resp;
    update();
  }

  void setPos(index) async{
    ModelHome.setPos = index;
    update();
  }

  void setScroll(_scrollController) async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll == currentScroll) {
      readMedicineMore();
    }
    update();
  }
}