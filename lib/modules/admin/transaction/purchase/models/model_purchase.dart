class ModelPurchase {
  static String modules = 'trPurchase';
  static String titlePage = 'Pembelian';
  static String result;
  static String barcode = '';
  static String id;
  static String paymentStatus = 'cod';
  static int qtyReturn = 0;
  static int qtyAdjustments = 0;
  static int qtyAdjustmentsDifference = 0;
  static double totalReturn = 0;
  static double totalAdjustments = 0;
  static double total = 0;
  static double subtotal = 0;
  static double discount = 0;
  static double payment = 0;
  static double balance = 0; 
  static double grandTotal = 0; 
  static double ppn = 0; 
  static double ppnPrice = 0;
   
  static bool isPPN = false;
  static bool isLoading;
  static bool isLoadingData;
  static bool isExistInvoice = false;
  static String resp;

  static Map data = {};
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static double totalValue = 0;
  static bool maxData;
  
  static List<dynamic> getData = [];
  static List<dynamic> getDetailMedicine = [];
  static List<dynamic> getSupplier = [];
  static List<dynamic> getPaymentStatus = [
    {'id':'paid', 'name': 'Lunas'},
    {'id':'credit', 'name': 'Kredit'},
    {'id':'cod', 'name': 'Cash On Delivery (COD)'},
    {'id':'consignment', 'name': 'Konsinyasi'},
  ];
  static List<dynamic> getCart = [];
  static List<dynamic> getCartOld = [];
  static Map getInvoice = {};

  static String transactionsId = '';
  static String supplierId = '';
  static String supplierName = '';
  static String supplierPhone = '';
  static String supplierInvoiceNumber = '';
  static DateTime supplierInvoiceDate = DateTime.now();
  static DateTime supplierRepaymentDate = DateTime.now();
}