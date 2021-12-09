class ModelSalesLab {
  static String modules = 'trSalesLab';
  static String titlePage = 'Penjualan Lab';
  static String result;
  static String barcode = '';
  static double total = 0;
  static double discount = 0;
  static double payment = 0;
  static double balance = 0; 
  static double grandTotal = 0; 

  static String patientName = '';
  static String patientAge = '';
  static String patientGlucoseFasting = '';
  static String patientGlucose2hoursPP = '';
  static String patientGlucoseRandom = '';
  static String patientUricAcid = '';
  static String patientCholesterol = '';
  static String patientBloodPressure = '';

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