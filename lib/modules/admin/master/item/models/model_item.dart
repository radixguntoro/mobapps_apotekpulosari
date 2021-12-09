class ModelItem {
  static String modules = 'item';
  static String titlePage = 'Barang';
  static String id;
  static String name;
  static String categoryId;
  static String categoryName;
  static String unitId;
  static String unitName;
  static String supplierPersonsId = '1022000000';
  static String supplierPersonsName = 'APOTEK PULOSARI';
  static String status;
  static String condition;
  static int qtyTotal;
  static int qtyMin;
  static String tabletId;
  static String tabletUnit;
  static String tabletBarcode;
  static String tabletQrcode;
  static double tabletPriceSell;
  static double tabletPricePurchase;
  static int tabletQty;
  static double tabletProfitPercent;
  static double tabletProfitValue;
  static String imgBase64;

  static String page = 'firstPage';
  static String resp;
  static String result;
  static String sortByName = '';
  static String form = 'box';
  static bool isLoading;
  static bool isValidate;

  static Map data = {};
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  static List<dynamic> getData = [];
  static List<dynamic> getSupplier = [];
  static List<dynamic> getCategory = [];
  static List<dynamic> getUnit = [];
  static List<dynamic> getCart = [];
}