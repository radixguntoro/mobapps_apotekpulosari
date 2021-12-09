import 'package:apotik_pulosari/components/snackbar/snackbar.dart';
import 'package:apotik_pulosari/modules/admin/transaction/return/models/model_return.dart';
import 'package:apotik_pulosari/modules/admin/transaction/return/services/return_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class ReturnController extends GetxController {
  String id;
  int page = 1;
  int limit = 10;
  String result = '';

  ReturnController({
    this.id,
  });

  void isLoadingTrue() async{
    ModelReturn.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelReturn.isLoading = false;
  }

  void clearData() {
    ModelReturn.barcode = '';
    ModelReturn.medicineId = '';
    ModelReturn.medicineName = '';
    ModelReturn.medicinePrice = 0;
    ModelReturn.discountReturn = 0;
    ModelReturn.qtyReturn = 0;
    ModelReturn.totalReturn = 0;
  }
  
  @override

  void onInit() {
    ModelReturn.result = 'ready';
  }

  void scanDataByBarcodeQRCode(barcode) async {
    result = await ReturnService.readDataByBarcodeQRCode(barcode);
    ModelReturn.barcode = '';
    if(result == 'notfound') {
      Get.snackbar(
        "Oops!",
        "Barang tidak ditemukan",
        titleText: Container(
          child: Text(
            "Oops!",
            style: TextStyle(
              color: Colors.red[800],
              fontWeight: FontWeight.w600,
              fontSize: 12
            )
          ),
        ),
        messageText: Text(
          "Barang tidak ditemukan",
          style: TextStyle(
            color: Colors.red[900],
            fontSize: 12,
          )
        ),
        backgroundColor: Colors.red[50].withOpacity(0.95),
        shouldIconPulse: true,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(16),
        icon: Icon(
          Mdi.closeCircle,
          size: 24,
          color: Colors.red,
        ), 
        barBlur: 0,
        duration: Duration(seconds: 3),
        borderRadius: 5,
      );
    }
    update();
  }

  void setItem(data) async {
    ModelReturn.medicineId = data['id'];
    ModelReturn.medicineName = data['name'];
    ModelReturn.medicinePrice = double.parse(data['tabletPriceSell']);
    update();
  }

  void setDiscount(val) async {
    if(val.length < 1) {
      ModelReturn.discountReturn = 0;
      update();
    } else {
      ModelReturn.discountReturn = double.parse((val.replaceAll('.','')).replaceAll(',','.'));
      update();
    }
    calcReturn();
  }

  void setQty(val) async {
    if(val.length < 1) {
      ModelReturn.qtyReturn = 0;
      update();
    } else {
      ModelReturn.qtyReturn = int.parse(val.replaceAll('.',''));
      update();
    }
    calcReturn();
  }

  void calcReturn() async {
    ModelReturn.totalReturn = (ModelReturn.medicinePrice - (ModelReturn.medicinePrice * (ModelReturn.discountReturn / 100))) * ModelReturn.qtyReturn;
    update();
  }

  void createData() async {
    isLoadingTrue();
    update();
    try {
      var resp = await ReturnService.createData();
      if (resp == 'success') {
        ModelReturn.result = ModelReturn.resp;
        clearData();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.created();
      } else {
        ModelReturn.result = ModelReturn.resp;
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.failed();
      }
    } catch (e) {
      print(e.toString());
      Snackbar.failed();
      return null;
    }
  }

  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 10;
    ModelReturn.maxData = false;
    var resp = await ReturnService.readData(page, limit);
    ModelReturn.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelReturn.currentPage + 1;
    var resp = await ReturnService.readData(page, limit);
    if (resp.isEmpty) {
      ModelReturn.maxData = true;
    } else {
      ModelReturn.maxData = false;
      ModelReturn.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await ReturnService.readDataBySearch(type, page, limit);
    ModelReturn.getData = resp;
    update();
  }
}