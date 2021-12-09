class ModelStockAdjustments {
  static String modules = 'stockAdjustments';
  static String result;
  static String barcode = '';
  static double totalAdjustments = 0;
  static double discountAdjustments = 0;
  static String medicineId = '';
  static String medicineName = '';
  static double medicinePrice = 0;
  static int qtyAdjustments = 0;
  static int noteId = 1;

  static bool isLoading;
  static String resp;

  static Map data = {};
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  
  static List<dynamic> getData = [];
  static List<dynamic> getItem = [];
  static List<dynamic> getNote = [
    {'id': 1, 'title': 'Salah Input Data'},
    {'id': 2, 'title': 'Barang Kadaluarsa'},
    {'id': 3, 'title': 'Barang Rusak'},
  ];
}