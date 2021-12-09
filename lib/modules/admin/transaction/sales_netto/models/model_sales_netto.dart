class ModelSalesNetto {
  static String modules = 'trSalesNetto';
  static String titlePage = 'Penjualan Netto';
  static String result;
  static String barcode = '';
  static String customerPersonsId = 'empty';
  static String customerPersonsName = 'Pilih Pelanggan';
  static DateTime customerRepaymentDate = DateTime.now();
  static String paymentStatus = 'cod';
  static int qtyReturn = 0;
  static int qtyAdjustments = 0;
  static int qtyAdjustmentsDifference = 0;
  static double totalReturn = 0;
  static double totalAdjustments = 0;
  static double total = 0;
  static double discount = 0;
  static double payment = 0;
  static double balance = 0; 
  static double ppnPrice = 0;
  static double subtotal = 0; 
  static double ppn = 0; 
  static double grandTotal = 0; 
  static double feeDisplay = 0; 
  static DateTime dateStart = DateTime.now();
  static DateTime dateEnd = DateTime.now();

  static bool isPPN = false;  
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
    {'id':'cod', 'name': 'Cash On Delivery (COD)'},
    {'id':'consignment', 'name': 'Konsinyasi'},
  ];
  static Map getInvoice = {};
}