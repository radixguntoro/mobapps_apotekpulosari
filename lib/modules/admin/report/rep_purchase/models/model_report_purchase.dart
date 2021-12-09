class ModelReportPurchase {
  static String modules = 'reportPurchase';
  static String titlePage = 'Lap. Pembelian';
  static String medicineId = '';
  static String medicineName = '';
  static int state = 0;
  static DateTime dateStart = new DateTime.now();
  static DateTime dateEnd = new DateTime.now();
  static String supplierPersonsId = '';
  static String supplierPersonsName = '';

  static bool isLoading;
 
  static int currentPage;
  static int currentPageSupplier;
  static int currentPagePaid;
  static int lastPage;
  static int lastPageSupplier;
  static int lastPagePaid;
  static int totalData = 0;
  static bool maxData;
  static bool maxDataSupplier;
  static bool maxDataPaid;
  static List<dynamic> getData = [];
  static List<dynamic> getDataSupplier = [];
  static List<dynamic> getDataPaid = [];
  static List<dynamic> getItem = [];
  static List<dynamic> getPurchaseStatus = [
    {'id':'credit', 'name': 'Kredit'},
    {'id':'cod', 'name': 'Cash On Delivery (COD)'},
    {'id':'consignment', 'name': 'Konsinyasi'},
  ];
  static Map getDataHeader = {};
  static Map getDataHeaderSupplier = {};
  static Map getDataHeaderPaid = {};
  static Map getDataDetail = {};
  static Map getDataRecap = {};
}