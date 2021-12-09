import 'package:apotik_pulosari/config/url.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/models/model_dashboard.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_adjustments/models/model_stock_adjustments.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/models/model_stock_opname.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/models/model_customer.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/master/category/models/model_category.dart';
import 'package:apotik_pulosari/modules/admin/master/supplier/models/model_supplier.dart';
import 'package:apotik_pulosari/modules/admin/master/unit/models/model_unit.dart';
import 'package:apotik_pulosari/modules/admin/master/user/models/model_user.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/models/model_report_stock_opname.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/models/model_closing_cashier.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:apotik_pulosari/modules/admin/transaction/return/models/model_return.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_credit/models/model_sales_credit.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/models/model_sales_lab.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/models/model_sales_mix.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/models/model_sales_netto.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/models/model_sales_recipe.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_regular/models/model_sales_regular.dart';
import 'package:apotik_pulosari/modules/client/home/models/model_home.dart' as clientHome;
import 'package:apotik_pulosari/modules/utility/models/model_connection.dart';

//untuk route url api per modules
class Api {
  static Map route = {
    ModelConnection.modules: {
      'check': Url.baseUrl + "/api/admin/connection/check",
    },
    ModelAuth.modules: {
      'googlelogin': Url.baseUrl + "/api/admin/auth/googlelogin",
      'login': Url.baseUrl + "/api/admin/auth/login",
      'logout': Url.baseUrl + "/api/admin/auth/logout",
    },
    ModelDashboard.modules: {
      'readTotalAsset': Url.baseUrl + "/api/admin/dashboard/total/asset",
      'readTransactionPerDay':
          Url.baseUrl + "/api/admin/dashboard/transactions/day",
    },
    ModelCategory.modules: {
      'create': Url.baseUrl + "/api/admin/category/create",
      'readList': Url.baseUrl + "/api/admin/category/read/list?",
      'readId': Url.baseUrl + "/api/admin/category/read/id/",
      'readDataAll': Url.baseUrl + "/api/admin/category/read/all",
      'update': Url.baseUrl + "/api/admin/category/update",
      'delete': Url.baseUrl + "/api/admin/category/delete",
    },
    ModelUnit.modules: {
      'create': Url.baseUrl + "/api/admin/unit/create",
      'readList': Url.baseUrl + "/api/admin/unit/read/list?",
      'readId': Url.baseUrl + "/api/admin/unit/read/id/",
      'readDataAll': Url.baseUrl + "/api/admin/unit/read/all",
      'update': Url.baseUrl + "/api/admin/unit/update",
      'delete': Url.baseUrl + "/api/admin/unit/delete",
    },
    ModelItem.modules: {
      'create': Url.baseUrl + "/api/admin/medicine/create",
      'readByBarcode': Url.baseUrl + "/api/admin/medicine/read/barcode?",
      'update': Url.baseUrl + "/api/admin/medicine/update",
      'delete': Url.baseUrl + "/api/admin/medicine/delete",
      'list': Url.baseUrl + "/api/admin/medicine/list?",
    },
    ModelUser.modules: {
      'create': Url.baseUrl + "/api/admin/user/create",
      'readList': Url.baseUrl + "/api/admin/user/read/list?",
      'readId': Url.baseUrl + "/api/admin/user/read/data?",
      'readRoles': Url.baseUrl + "/api/admin/user/read/roles",
      'update': Url.baseUrl + "/api/admin/user/update",
      'updateProfile': Url.baseUrl + "/api/admin/user/update/profile",
      'updatePassword': Url.baseUrl + "/api/admin/user/update/password",
      'updateAuth': Url.baseUrl + "/api/admin/user/update/auth",
      'delete': Url.baseUrl + "/api/admin/user/delete",
      'list': Url.baseUrl + "/api/admin/user/list?",
    },
    ModelSupplier.modules: {
      'create': Url.baseUrl + "/api/admin/supplier/create",
      'readList': Url.baseUrl + "/api/admin/supplier/read/list?",
      'readId': Url.baseUrl + "/api/admin/supplier/read",
      'readDataAll': Url.baseUrl + "/api/admin/supplier/read/all",
      'update': Url.baseUrl + "/api/admin/supplier/update",
      'delete': Url.baseUrl + "/api/admin/supplier/delete",
    },
    ModelCustomer.modules: {
      'create': Url.baseUrl + "/api/admin/customer/create",
      'readList': Url.baseUrl + "/api/admin/customer/read/list?",
      'readId': Url.baseUrl + "/api/admin/customer/read",
      'readDataAll': Url.baseUrl + "/api/admin/customer/read/all",
      'update': Url.baseUrl + "/api/admin/customer/update",
      'delete': Url.baseUrl + "/api/admin/customer/delete",
    },
    ModelPurchase.modules: {
      'create': Url.baseUrl + "/api/admin/trPurchase/create/data",
      'createRepayment': Url.baseUrl + "/api/admin/trPurchase/create/repayment",
      'createReturn': Url.baseUrl + "/api/admin/trPurchase/create/return",
      'createAdjustments':
          Url.baseUrl + "/api/admin/trPurchase/create/adjustments",
      'list': Url.baseUrl + "/api/admin/trPurchase/list?",
      'readExistInvoice':
          Url.baseUrl + "/api/admin/trPurchase/read/exist/invoice/",
      'readDetailMedicineId':
          Url.baseUrl + "/api/admin/trPurchase/read/detail/medicine/",
      'print': Url.baseUrl + "/api/admin/trPurchase/recap/print/",
      'updateData': Url.baseUrl + "/api/admin/trPurchase/update/data",
      'updateDate': Url.baseUrl + "/api/admin/trPurchase/update/date",
      'delete': Url.baseUrl + "/api/admin/trPurchase/delete/data",
    },
    ModelSalesRegular.modules: {
      'create': Url.baseUrl + "/api/admin/trSalesRegular/create",
      'list': Url.baseUrl + "/api/admin/trSalesRegular/list?",
      'print': Url.baseUrl + "/api/admin/trSalesRegular/recap/print/",
    },
    ModelSalesRecipe.modules: {
      'create': Url.baseUrl + "/api/admin/trSalesRecipe/create",
      'list': Url.baseUrl + "/api/admin/trSalesRecipe/list?",
      'print': Url.baseUrl + "/api/admin/trSalesRecipe/recap/print/",
    },
    ModelSalesMix.modules: {
      'create': Url.baseUrl + "/api/admin/trSalesMix/create",
      'list': Url.baseUrl + "/api/admin/trSalesMix/list?",
      'print': Url.baseUrl + "/api/admin/trSalesMix/recap/print/",
    },
    ModelSalesLab.modules: {
      'create': Url.baseUrl + "/api/admin/trSalesLab/create",
      'list': Url.baseUrl + "/api/admin/trSalesLab/list?",
      'print': Url.baseUrl + "/api/admin/trSalesLab/recap/print/",
    },
    ModelSalesNetto.modules: {
      'create': Url.baseUrl + "/api/admin/trSalesNetto/create/data",
      'createRepayment':
          Url.baseUrl + "/api/admin/trSalesNetto/create/repayment",
      'createReturn': Url.baseUrl + "/api/admin/trSalesNetto/create/return",
      'createAdjustments':
          Url.baseUrl + "/api/admin/trSalesNetto/create/adjustments",
      'list': Url.baseUrl + "/api/admin/trSalesNetto/list?",
      'print': Url.baseUrl + "/api/admin/trSalesNetto/recap/print/",
    },
    ModelSalesCredit.modules: {
      'create': Url.baseUrl + "/api/admin/trSalesCredit/create/data",
      'createRepayment':
          Url.baseUrl + "/api/admin/trSalesCredit/create/repayment",
      'list': Url.baseUrl + "/api/admin/trSalesCredit/list?",
      'print': Url.baseUrl + "/api/admin/trSalesCredit/recap/print/",
    },
    ModelReturn.modules: {
      'create': Url.baseUrl + "/api/admin/return/create",
      'readList': Url.baseUrl + "/api/admin/return/read/list?",
    },
    ModelClosingCashier.modules: {
      'create': Url.baseUrl + "/api/admin/closingCashier/create",
      'readList': Url.baseUrl + "/api/admin/closingCashier/list?",
      'readSalesAll': Url.baseUrl + "/api/admin/closingCashier/sales/all?",
      'readSalesType': Url.baseUrl + "/api/admin/closingCashier/sales/type?",
      'readShift': Url.baseUrl + "/api/admin/closingCashier/shift",
      'readCashier': Url.baseUrl + "/api/admin/closingCashier/cashier?",
      'update': Url.baseUrl + "/api/admin/closingCashier/update",
    },
    ModelStockOpname.modules: {
      'create': Url.baseUrl + "/api/admin/stockOpname/create",
      'readList': Url.baseUrl + "/api/admin/stockOpname/read/data/list?",
      'readListMedicine': Url.baseUrl + "/api/admin/stockOpname/read/medicine/list?",
    },
    ModelStockAdjustments.modules: {
      'createIncomingGoods': Url.baseUrl + "/api/admin/stockAdjustments/create/incomingGoods",
      'createExitGoods': Url.baseUrl + "/api/admin/stockAdjustments/create/exitGoods",
      'readList': Url.baseUrl + "/api/admin/stockAdjustments/read/data/list?",
    },
    ModelReportItemCard.modules: {
      'readHistoryStockList': Url.baseUrl + "/api/admin/report/item/card/list/data?",
      'readHistoryStockDetail': Url.baseUrl + "/api/admin/report/item/card/detail/data?",
      'readItemStockList': Url.baseUrl + "/api/admin/report/item/card/stock/data?",
      'readItemStockOutList': Url.baseUrl + "/api/admin/report/item/card/stock/out?",
      'readItemStockInList': Url.baseUrl + "/api/admin/report/item/card/stock/in?",
    },
    ModelReportSales.modules: {
      'readList': Url.baseUrl + "/api/admin/report/sales/list/data?",
      'readDetail': Url.baseUrl + "/api/admin/report/sales/detail/data?",
    },
    ModelReportPurchase.modules: {
      'readList': Url.baseUrl + "/api/admin/report/purchase/list/data?",
      'readDetail': Url.baseUrl + "/api/admin/report/purchase/detail/data?",
    },
    ModelReportStockOpname.modules: {
      'readList': Url.baseUrl + "/api/admin/report/stockOpname/list/data?",
    },
    clientHome.ModelHome.modules: {
      'readMedicine': Url.baseUrl + "/api/admin/home/read/medicines?",
    },
  };
}
