class ModelClosingCashier {
  static String modules = 'closingCashier';
  static String titlePage = 'Tutup Kasir';
  static String result;
  static String barcode = '';
  static double total = 0;
  static double discount = 0;
  static double payment = 0;
  static double balance = 0; 
  static double grandTotal = 0; 
  static double incomeApp = 0; 
  static double incomeAppTotalByCashier = 0; 
  static double incomeAppTotalBySales = 0; 
  static double incomeReal = 0; 
  static String shift;

  static bool isLoading;
  static String resp;

  static Map data = {};
  static int currentPage;
  static int totalData = 0;
  static int currentPageSales;
  static int totalDataSales = 0;
  static int isDetailState = 0;
  static bool maxData;
  
  static List<dynamic> getData = [];
  static List<dynamic> getDetailByCashier = [];
  static List<dynamic> getDetailBySales = [];
  static List<dynamic> getSales = [];
  static Map getInvoice = {};
}