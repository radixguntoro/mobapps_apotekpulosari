class ModelSalesRegular {
  static String modules = 'trSalesRegular';
  static String titlePage = 'Penjualan Reguler';
  static String result;
  static String barcode = '';
  static double total = 0;
  static double discount = 0;
  static double payment = 0;
  static double balance = 0; 
  static double grandTotal = 0; 

  static bool isLoading;
  static String resp;

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
  static Map getInvoice = {};
}