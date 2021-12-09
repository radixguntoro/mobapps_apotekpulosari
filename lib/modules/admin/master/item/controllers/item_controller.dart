import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/master/item/services/item_service.dart';
import 'package:apotik_pulosari/modules/admin/master/category/services/category_service.dart';
import 'package:apotik_pulosari/modules/admin/master/supplier/services/supplier_service.dart';
import 'package:apotik_pulosari/modules/admin/master/unit/services/unit_service.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ItemController extends GetxController {
  GetStorage box = GetStorage();
  String result = '';
  Map response = {};
  bool isShotCamera = false;
  File imgFrom;

  int page = 1;
  int limit = 10;
  List<dynamic> filterCategory = [];
  List<dynamic> filterUnit = [];

  bool filterOtc = true;
  bool filterVens = true;
  bool filterPsiko = true;
  bool filterStik = true;
  bool filterPrek = true;

  void isLoadingTrue() async{
    ModelItem.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelItem.isLoading = false;
  }

  @override
  void onInit() {
    ModelItem.result = 'ready';
    // readFirst();
  }

  void clearInput() {
    ModelItem.name = '';
    ModelItem.categoryId = '1002000005';
    ModelItem.unitId = '1';
    ModelItem.supplierPersonsId = '1022000000';
    ModelItem.qtyTotal = 0;
    ModelItem.qtyMin = 0;
    ModelItem.status = 'active';
    ModelItem.condition = 'new';
    // FORM DETAIL TABLET
    ModelItem.tabletUnit = 'Tablet';
    ModelItem.tabletBarcode = '';
    ModelItem.tabletQrcode = '';
    ModelItem.tabletPriceSell = 0;
    ModelItem.tabletPricePurchase = 0;
    ModelItem.tabletQty = 0;
    ModelItem.tabletProfitPercent = 10;
    ModelItem.tabletProfitValue = 0;
    ModelItem.imgBase64 = '';
    update();
  }

  void scanTabletBarcodeQRCode(barcode) async {
    ModelItem.tabletBarcode = barcode;
    update();
  }

  void clearTabletBarcodeQRCode() async {
    ModelItem.tabletBarcode = '';
    update();
  }

  void createData() async{
    ModelItem.imgBase64 = imgFrom == null ? null : base64.encode(await imgFrom.readAsBytes());
    isLoadingTrue();
    update();
    try {
      response = await ItemService.createData();
      if (response['status'] == 1) {
        result = 'success';
        ModelItem.page = 'firstPage';
        readFirst();
        isLoadingFalse();
        update();
      } else {
        result = 'failed';
        isLoadingFalse();
        // Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 10;
    ModelItem.maxData = false;
    var resp = await ItemService.readData(page, limit, ModelItem.sortByName, filterCategory, filterUnit);
    ModelItem.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelItem.currentPage + 1;
    var resp = await ItemService.readData(page, limit, ModelItem.sortByName, filterCategory, filterUnit);
    if (resp.isEmpty) {
      ModelItem.maxData = true;
    } else {
      ModelItem.maxData = false;
      ModelItem.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await ItemService.readDataBySearch(type, page, limit, ModelItem.sortByName, filterCategory, filterUnit);
    ModelItem.getData = resp;
    update();
  }

  void readCategoryAll() async {
    try {
      var resp = await CategoryService.readDataAll();
      // print(resp);
      if (resp.isEmpty) {
        ModelItem.getCategory = [];
      } else {
        ModelItem.getCategory = resp;
      }
      update();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void readUnitAll() async {
    try {
      var resp = await UnitService.readDataAll();
      print("Unit $resp");
      if (resp.isEmpty) {
        ModelItem.getUnit = [];
      } else {
        ModelItem.getUnit = resp;
      }
      update();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void readSupplierAll() async {
    try {
      var resp = await SupplierService.readDataAll();
      if (resp.isEmpty) {
        ModelItem.getSupplier = [];
      } else {
        ModelItem.getSupplier = resp;
      }
      update();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void readDetailData(data) async{
    ModelItem.page = 'firstPage';
    isLoadingTrue();
    update();
    try {
      var resp = await ItemService.readDetailData(data);
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
    ModelItem.imgBase64 = imgFrom == null ? null : base64.encode(await imgFrom.readAsBytes());
    isLoadingTrue();
    update();
    try {
      response = await ItemService.updateData();
      if (response['status'] == 1) {
        result = 'success';
        ModelItem.page = 'firstPage';
        readFirst();
        isLoadingFalse();
        update();
      } else {
        result = 'failed';
        isLoadingFalse();
        // Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void setCategory(val) async{
    ModelItem.categoryId = val;
    update();
    switch (val) {
      case '1002000005':
        ModelItem.tabletProfitPercent = (0.1 * 100);
        update();
        break;
      case '1002000004':
        ModelItem.tabletProfitPercent = (0.0925 * 100);
        update();
        break;
      case '1002000003':
        ModelItem.tabletProfitPercent = (0.13 * 100);
        update();
        break;
      case '1002000002':
        ModelItem.tabletProfitPercent = (0.16 * 100);
        update();
        break;
      case '1002000001':
        ModelItem.tabletProfitPercent = (0.15 * 100);
        update();
        break;
      default:
    }
  }

  void setUnit(val) async{
    ModelItem.unitId = val.toString();
    update();
  }

  void setSupplier(val) async{
    ModelItem.supplierPersonsId = val['id'];
    ModelItem.supplierPersonsName = val['name'];
    print(val);
    update();
  }

  void setClearSupplier() async{
    ModelItem.supplierPersonsId = '1022000000';
    ModelItem.supplierPersonsName = 'APOTEK PULOSARI';
    update();
  }

  void setForm(val) async{
    switch (val) {
      case 'firstPage':
        ModelItem.page = 'firstPage';
        update();
        break;
      case 'secondPage':
        ModelItem.page = 'secondPage';
        update();
        break;
      case 'thirdPage':
        ModelItem.page = 'thirdPage';
        update();
        break;
      default:
    }
  }

  void setResetFilter() async {
    filterOtc = true;
    filterVens = true;
    filterPsiko = true;
    filterStik = true;
    filterPrek = true;
    filterCategory = [];
    ModelItem.sortByName = '';
    readFirst();
    update();
  }

  void setFilterCategory(val, categoryId) async{
    switch (categoryId) {
      case '1002000005':
        filterOtc = !val ? true : false;
        if (filterOtc == false) {
          filterCategory.add(categoryId.trim());
        } else {
          filterCategory.remove(categoryId.trim());
        }
        update();
        break;
      case '1002000004':
        filterVens = !val ? true : false;
        if (filterVens == false) {
          filterCategory.add(categoryId.trim());
        } else {
          filterCategory.remove(categoryId.trim());
        }
        update();
        break;
      case '1002000003':
        filterPsiko = !val ? true : false;
        if (filterPsiko == false) {
          filterCategory.add(categoryId.trim());
        } else {
          filterCategory.remove(categoryId.trim());
        }
        update();
        break;
      case '1002000002':
        filterStik = !val ? true : false;
        if (filterStik == false) {
          filterCategory.add(categoryId.trim());
        } else {
          filterCategory.remove(categoryId.trim());
        }
        update();
        break;
      case '1002000001':
        filterPrek = !val ? true : false;
        if (filterPrek == false) {
          filterCategory.add(categoryId.trim());
        } else {
          filterCategory.remove(categoryId.trim());
        }
        update();
        break;
      default:
    }
    print(filterCategory);
    readFirst();
  }

  void setFilterUnit(unitId) async{
    if (filterUnit.length > 0) {
      var result = filterUnit.where((item) => item == unitId);
      if (result.isEmpty) {
        filterUnit.add(unitId);
      } else {
        filterUnit.removeWhere((item) => item == unitId);
      }
    } else {
      filterUnit.add(unitId);
    }
    print(filterUnit);
    readFirst();
    update();
  }

  void setSortByName(sort) {
    ModelItem.sortByName = sort;
    readFirst();
    update();
  }

  void calcPricePurchase(val) async {
    // print(ModelItem.tabletProfitPercent);
    if(val.length == 0) {
      ModelItem.tabletPriceSell = 0;
    } else {
      ModelItem.tabletPriceSell = double.parse(val.replaceAll('.',''));
      ModelItem.tabletPricePurchase = double.parse(val.replaceAll('.','')) * (100/(ModelItem.tabletProfitPercent + 100));
    }
    update();
  }

  void setImageCamera() async {
    // this.update();
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      imgFrom = File(pickedFile.path);

      final dir = await path_provider.getTemporaryDirectory();
      List<String> dataPath = pickedFile.path.split('/');

      String temporaryName =
      dataPath[dataPath.length - 1].replaceAll('.jpg', '');
      temporaryName = temporaryName.replaceAll('.png', '');
      temporaryName = temporaryName.replaceAll('.jpeg', '');
      temporaryName = temporaryName + "-temp.jpg";
      final targetPath = dir.absolute.path + "/$temporaryName";

      imgFrom = await FlutterImageCompress.compressAndGetFile(
        pickedFile.path,
        targetPath,
        minWidth: 500,
        minHeight: 500,
      );

      isShotCamera = true;
    }
    print(imgFrom.toString());
    update();
  } 
}