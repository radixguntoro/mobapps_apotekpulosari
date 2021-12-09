import 'package:apotik_pulosari/modules/admin/master/supplier/models/model_supplier.dart';
import 'package:apotik_pulosari/modules/admin/master/supplier/services/supplier_service.dart';
import 'package:get/get.dart';

class SupplierController extends GetxController {
  String name;
  String address;
  String city;
  String identityNumber;
  String status;
  String personsId;

  int page = 1;
  int limit = 10;

  SupplierController({
    this.personsId, 
    this.name,
    this.address,
    this.city,
    this.identityNumber,
    this.status,
  });

  @override
  void onInit() {
    ModelSupplier.result = 'ready';
  }

  void isLoadingTrue() {
    ModelSupplier.isLoading = true;
  }

  void isLoadingFalse() {
    ModelSupplier.isLoading = false;
  }

  void clearInput() {
    ModelSupplier.name = '';
    ModelSupplier.address = '';
    ModelSupplier.city = '';
    ModelSupplier.identityNumber = '';
    ModelSupplier.status = 'active';
    ModelSupplier.phone = '';
    update();
  }

  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 10;
    ModelSupplier.maxData = false;
    var resp = await SupplierService.readData(page, limit);
    ModelSupplier.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelSupplier.currentPage + 1;
    var resp = await SupplierService.readData(page, limit);
    if (resp.isEmpty) {
      ModelSupplier.maxData = true;
    } else {
      ModelSupplier.maxData = false;
      ModelSupplier.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await SupplierService.readDataBySearch(type, page, limit);
    ModelSupplier.getData = resp;
    update();
  }

  void readDetailData(data) async{
    isLoadingTrue();
    update();
    try {
      var resp = await SupplierService.readDetailData(data);
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

  void createData() async{
    if(ModelSupplier.name.length == 0) {
      ModelSupplier.isValidate = false;
      update();
    } else {
      isLoadingTrue();
      ModelSupplier.isValidate = true;
      update();
      try {
        var resp = await SupplierService.createData();
        if (resp == "success") {
          ModelSupplier.result = resp;
          isLoadingFalse();
          update();
        } else if(resp == "failed") {
          ModelSupplier.result = resp;
          isLoadingFalse();
          update();
        }
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }

  void updateData() async{
    if(ModelSupplier.name.length == 0) {
      ModelSupplier.isValidate = false;
      update();
    } else {
      isLoadingTrue();
      ModelSupplier.isValidate = true;
      update();
      try {
        var resp = await SupplierService.updateData();
        if (resp == "success") {
          ModelSupplier.result = resp;
          isLoadingFalse();
          update();
        } else if(resp == "failed") {
          ModelSupplier.result = resp;
          isLoadingFalse();
          update();
        }
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }

  void selectStatus(val) async{
    ModelSupplier.status = val;
    update();
  }
}