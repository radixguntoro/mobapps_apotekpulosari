import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/models/model_sales_recipe.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SalesRecipeService {
  static String modules = 'trSalesRecipe';
  static String moduleItems = 'item';
  String id;

  SalesRecipeService({
    this.id,
  });

  static Future<dynamic> createData() async {
    ModelSalesRecipe.data = {
      'patient': ModelSalesRecipe.patient,
      'address': ModelSalesRecipe.address,
      'doctor': ModelSalesRecipe.doctor,
      'date': ModelSalesRecipe.date.toString(),
      'total': ModelSalesRecipe.total.toString(),
      'discount': ModelSalesRecipe.discount.toString(),
      'grand_total': ModelSalesRecipe.grandTotal.toString(),
      'payment': ModelSalesRecipe.payment.toString(),
      'balance': ModelSalesRecipe.balance.toString(),
      'medicineRecipe': ModelSalesRecipe.medicineRecipe
    };

    Map data = {
      "trSalesRecipe": json.encode(ModelSalesRecipe.data)
    };
    // print(data.toString());
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);

      return resp;
    } catch (e) {
      return "error";
    }
  }

  static Future<String> readDataByBarcodeQRCode(barcode) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[moduleItems]['readByBarcode'] + "id=$barcode", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      if(resp['medicine'] != null) {
        ModelSalesRecipe.getCart.add({
          'medicines_items_id': resp['medicine']['medicines_items_id'],
          'name': resp['medicine']['item']['name'],
          'price': double.parse(resp['medicine']['price_sell']) + (double.parse(resp['medicine']['price_sell']) * 0.1),
          'qty_total': resp['medicine']['qty_total'],
          'qty': 1,
          'subtotal': double.parse(resp['medicine']['price_sell']) + (double.parse(resp['medicine']['price_sell']) * 0.1),
          'discount': 0,
          'unit': resp['medicine']['unit'],
          'category': resp['medicine']['item']['category']['name'],
        });
        return "success";
      } else {
        return "notfound";
      }
    } else {
      return "failed";
    }
  }
  
  static Future<Map> readDataById(id) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print("Inputan ${Api.route[modules]['print'] + "$id"}");
    final request = await http.get(
      Api.route[modules]['print'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp['tr_sales_recipe'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readData(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[modules]['list'] + "search=&page=$page&row=$limit}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelSalesRecipe.totalData = resp['total'];
      ModelSalesRecipe.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[modules]['list'] + "search=$type&row=$limit}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelSalesRecipe.totalData = resp['total'];
      ModelSalesRecipe.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}