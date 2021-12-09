class ModelSalesMix {
  static String modules = 'trSalesMix';
  static String titlePage = 'Penjualan Racik';
  static String result;
  static String barcode = '';
  static double total = 0;
  static double discount = 0;
  static double feePharmacist = 0;
  static double payment = 0;
  static double balance = 0; 
  static double grandTotal = 0;
  static List<dynamic> medicineMix = [];

  static List<dynamic> getCart = [];
  static String mixName = '';
  static double mixTotal = 0;
  static double mixGrandTotal = 0;
  static double mixTuslah = 0;

  static String patient = '';
  static String weight = '';
  static String age = '';

  static bool isLoading;
  static String resp;

  static Map data = {};
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  
  static List<dynamic> getData = [];
  static Map getInvoice = {};
}