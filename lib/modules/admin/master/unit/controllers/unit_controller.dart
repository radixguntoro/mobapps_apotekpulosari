import 'package:apotik_pulosari/modules/admin/master/unit/models/model_unit.dart';
import 'package:apotik_pulosari/modules/admin/master/unit/services/unit_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UnitController extends GetxController {
  GetStorage box = GetStorage();
  String id;
  String name;

  int page = 1;
  int limit = 50;

  UnitController({
    this.id,
    this.name,
  });

  void isLoadingTrue() async{
    ModelUnit.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelUnit.isLoading = false;
  }

  @override
  void onInit() {
    ModelUnit.result = 'ready';
    // readFirst();
  }

  void clearInput() {
    ModelUnit.id = '';
    ModelUnit.name = '';
    update();
  }

  void createData() async{
    if(ModelUnit.name.length == 0) {
      ModelUnit.isValidate = false;
      update();
    } else {
      isLoadingTrue();
      ModelUnit.isValidate = true;
      update();
      try {
        var resp = await UnitService.createData();
        if (resp == "success") {
          ModelUnit.result = resp;
          isLoadingFalse();
          update();
        } else if(resp == "failed") {
          ModelUnit.result = resp;
          isLoadingFalse();
          update();
        }
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }

  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 50;
    ModelUnit.maxData = false;
    var resp = await UnitService.readData(page, limit);
    ModelUnit.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelUnit.currentPage + 1;
    var resp = await UnitService.readData(page, limit);
    if (resp.isEmpty) {
      ModelUnit.maxData = true;
    } else {
      ModelUnit.maxData = false;
      ModelUnit.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await UnitService.readDataBySearch(type, page, limit);
    ModelUnit.getData = resp;
    update();
  }

  void readDetailData(data) async{
    isLoadingTrue();
    update();
    try {
      var resp = await UnitService.readDetailData(data);
      if (resp == "success") {
        isLoadingFalse();
        update();
      } else if(resp == "failed") {
        isLoadingFalse();
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void updateData() async{
    isLoadingTrue();
    update();
    try {
      var resp = await UnitService.updateData();
      if (resp == "success") {
        ModelUnit.result = resp;
        isLoadingFalse();
        update();
      } else if(resp == "failed") {
        ModelUnit.result = resp;
        isLoadingFalse();
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}