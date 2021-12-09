class ModelReturn {
  static String modules = 'return';
  static String result;
  static String barcode = '';
  static double totalReturn = 0;
  static double discountReturn = 0;
  static String medicineId = '';
  static String medicineName = '';
  static double medicinePrice = 0;
  static int qtyReturn = 0;

  static bool isLoading;
  static String resp;

  static Map data = {};
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  
  static List<dynamic> getData = [];
  static List<dynamic> getItem = [];
}