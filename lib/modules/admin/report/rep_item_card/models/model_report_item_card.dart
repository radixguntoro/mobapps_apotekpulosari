class ModelReportItemCard {
  static String modules = 'reportItemCard';
  static String titlePage = 'Lap. Kartu Barang';
  static String medicineId = '';
  static String medicineName = 'Cari nama barang...';
  static DateTime dateStart = new DateTime.now();
  static DateTime dateEnd = new DateTime.now();
  static int state = 0;

  static bool isLoading;
 
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static int qtyItemsOut = 0;
  static int qtyItemsIn = 0;
  static double totalItemsOut = 0;
  static double totalItemsIn = 0;
  static bool maxData;
  static List<dynamic> getData = [];
  static List<dynamic> getItem = [];
  static List<dynamic> dataItems = [];
  static List<dynamic> dataItemsOut = [];
  static List<dynamic> dataItemsIn = [];
  static List<dynamic> filterCategory = [];
  static Map getDataTransaction = {};

  static double maxScroll;
  static double currentScroll;
}