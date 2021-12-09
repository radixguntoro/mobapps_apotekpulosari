import 'package:apotik_pulosari/modules/admin/master/customer/models/model_customer.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/services/customer_service.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  String name;
  String address;
  String city;
  String identityNumber;
  String status;
  String personsId;

  int page = 1;
  int limit = 10;

  CustomerController({
    this.personsId, 
    this.name,
    this.address,
    this.city,
    this.identityNumber,
    this.status,
  });

  @override
  void onInit() {
    ModelCustomer.result = 'ready';
  }

  void isLoadingTrue() {
    ModelCustomer.isLoading = true;
  }

  void isLoadingFalse() {
    ModelCustomer.isLoading = false;
  }

  void clearInput() {
    ModelCustomer.name = '';
    ModelCustomer.address = '';
    ModelCustomer.city = '';
    ModelCustomer.identityNumber = '';
    ModelCustomer.status = 'active';
    ModelCustomer.phone = '';
    update();
  }

  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 10;
    ModelCustomer.maxData = false;
    var resp = await CustomerService.readData(page, limit);
    ModelCustomer.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelCustomer.currentPage + 1;
    var resp = await CustomerService.readData(page, limit);
    if (resp.isEmpty) {
      ModelCustomer.maxData = true;
    } else {
      ModelCustomer.maxData = false;
      ModelCustomer.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await CustomerService.readDataBySearch(type, page, limit);
    ModelCustomer.getData = resp;
    update();
  }

  void readDetailData(data) async{
    isLoadingTrue();
    update();
    try {
      var resp = await CustomerService.readDetailData(data);
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
    if(ModelCustomer.name.length == 0) {
      ModelCustomer.isValidate = false;
      update();
    } else {
      isLoadingTrue();
      ModelCustomer.isValidate = true;
      update();
      try {
        var resp = await CustomerService.createData();
        if (resp == "success") {
          ModelCustomer.result = resp;
          isLoadingFalse();
          update();
        } else if(resp == "failed") {
          ModelCustomer.result = resp;
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
    if(ModelCustomer.name.length == 0) {
      ModelCustomer.isValidate = false;
      update();
    } else {
      isLoadingTrue();
      ModelCustomer.isValidate = true;
      update();
      try {
        var resp = await CustomerService.updateData();
        if (resp == "success") {
          ModelCustomer.result = resp;
          isLoadingFalse();
          update();
        } else if(resp == "failed") {
          ModelCustomer.result = resp;
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
    ModelCustomer.status = val;
    update();
  }
}