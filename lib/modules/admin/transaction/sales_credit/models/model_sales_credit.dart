class ModelSalesCredit {
  static String modules = 'trSalesCredit';
  static String titlePage = 'Penjualan Kredit';
  static String result;
  static String barcode = '';
  static String customerPersonsId = 'empty';
  static String customerPersonsName = 'Pilih Pelanggan';
  static DateTime customerRepaymentDate = DateTime.now();
  static String paymentStatus = 'credit';
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
  static double totalValue = 0;
  static bool maxData;
  
  static List<dynamic> getData = [];
  static List<dynamic> getCart = [];
  static List<dynamic> getCustomer = [];
  static List<dynamic> getPaymentStatus = [
    {'id':'paid', 'name': 'Lunas'},
    {'id':'credit', 'name': 'Kredit'},
  ];
  static Map getInvoice = {};
}