import 'package:apotik_pulosari/modules/admin/master/category/models/model_category.dart';
import 'package:apotik_pulosari/modules/admin/master/category/services/category_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoryController extends GetxController {
  GetStorage box = GetStorage();
  String id;
  String name;

  int page = 1;
  int limit = 10;

  CategoryController({
    this.id,
    this.name,
  });

  void isLoadingTrue() async{
    ModelCategory.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelCategory.isLoading = false;
  }

  @override
  void onInit() {
    ModelCategory.result = 'ready';
    // readFirst();
  }

  void clearInput() {
    ModelCategory.id = '';
    ModelCategory.name = '';
    update();
  }

  void createData() async{
    if(ModelCategory.name.length == 0) {
      ModelCategory.isValidate = false;
      update();
    } else {
      isLoadingTrue();
      ModelCategory.isValidate = true;
      update();
      try {
        var resp = await CategoryService.createData();
        if (resp == "success") {
          ModelCategory.result = resp;
          isLoadingFalse();
          update();
        } else if(resp == "failed") {
          ModelCategory.result = resp;
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
    limit = 10;
    ModelCategory.maxData = false;
    var resp = await CategoryService.readData(page, limit);
    ModelCategory.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelCategory.currentPage + 1;
    var resp = await CategoryService.readData(page, limit);
    if (resp.isEmpty) {
      ModelCategory.maxData = true;
    } else {
      ModelCategory.maxData = false;
      ModelCategory.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await CategoryService.readDataBySearch(type, page, limit);
    ModelCategory.getData = resp;
    update();
  }

  void readDetailData(data) async{
    isLoadingTrue();
    update();
    try {
      var resp = await CategoryService.readDetailData(data);
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
      var resp = await CategoryService.updateData();
      if (resp == "success") {
        ModelCategory.result = resp;
        isLoadingFalse();
        update();
      } else if(resp == "failed") {
        ModelCategory.result = resp;
        isLoadingFalse();
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}