import 'package:apotik_pulosari/modules/admin/dashboard/models/model_dashboard.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/services/dashboard_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  int page = 1;
  int limit = 10;
  String date = '';

  @override
  void onInit() async {
    readTotalAsset();
    readTransactionPerDay();
  }

  void isLoadingTrue() async{
    ModelDashboard.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelDashboard.isLoading = false;
  }

  void readTotalAsset() async{
    var resp = await DashboardService.readTotalAsset();
    ModelDashboard.totalAsset = double.parse(resp['total_asset']);
    ModelDashboard.totalMedicineSalesRegular = double.parse(resp['medicine_sales_regular']);
    ModelDashboard.totalMedicineSalesRecipe = double.parse(resp['medicine_sales_recipe']);
    ModelDashboard.totalMedicineSalesMix = double.parse(resp['medicine_sales_mix']);
    ModelDashboard.totalMedicineSalesLab = double.parse(resp['medicine_sales_lab']);
    ModelDashboard.totalMedicineSalesNetto = double.parse(resp['medicine_sales_netto']);
    ModelDashboard.totalMedicineSalesCredit = double.parse(resp['medicine_sales_credit']);
    update();
  }

  void readTransactionPerDay() async{
    var resp = await DashboardService.readTransactionPerDay();
    ModelDashboard.totalSalesRegular = double.parse(resp['sales_regular']);
    ModelDashboard.totalSalesRecipe = double.parse(resp['sales_recipe']);
    ModelDashboard.totalSalesMix = double.parse(resp['sales_mix']);
    ModelDashboard.totalSalesLab = double.parse(resp['sales_lab']);
    ModelDashboard.totalSalesNetto = double.parse(resp['sales_netto']);
    ModelDashboard.totalSalesCredit = double.parse(resp['sales_credit']);
    ModelDashboard.totalSales = double.parse(resp['sales'].toString());
    ModelDashboard.totalPurchase = double.parse(resp['purchase']);
    ModelDashboard.totalPercentage = double.parse(resp['percentage'].toString());

    ModelDashboard.totalInvSalesRegular = resp['sales_regular_count'];
    ModelDashboard.totalInvSalesRecipe = resp['sales_recipe_count'];
    ModelDashboard.totalInvSalesMix = resp['sales_mix_count'];
    ModelDashboard.totalInvSalesLab = resp['sales_lab_count'];
    ModelDashboard.totalInvSalesNetto = resp['sales_netto_count'];
    ModelDashboard.totalInvSalesCredit = resp['sales_credit_count'];
    ModelDashboard.totalInvPurchase = resp['purchase_count'];
    update();
  }
}