class ModelStockOpname {
  static String modules = 'stockOpname';
  static String titlePage = 'Stok Opname';
  static String barcode;
  static String result;
  static String unit;
  static String status;
  static String medicineName;
  static String medicineId;
  static String medicineCategory;
  static String medicineUnit;
  static double pricePurchaseApp = 0;
  static double pricePurchasePhx = 0;
  static double pricePurchaseDifference = 0;
  static double pricePurchaseAppSubtotal = 0;
  static double pricePurchasePhxSubtotal = 0;
  static double priceSellApp = 0;
  static double priceSellPhx = 0;
  static double priceSellDifference = 0;
  static double priceSellAppSubtotal = 0;
  static double priceSellPhxSubtotal = 0;
  static int stockInSystem = 0;
  static int stockInPhysic = 0;
  static int stockInDifference = 0;

  static bool isLoading;
  static String resp;

  static Map data = {};
  static int currentPage;
  static int totalData = 0;
  static int currentPageSales;
  static int totalDataSales = 0;
  static bool maxData;
  
  static List<dynamic> getData = [];
  static List<dynamic> getItem = [];
}