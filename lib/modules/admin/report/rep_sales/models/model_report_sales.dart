class ModelReportSales {
  static String modules = 'reportSales';
  static String titlePage = 'Lap. Penjualan';
  static String medicineId = '';
  static String medicineName = '';
  static int state = 0;
  static DateTime dateStart = DateTime.now();
  static DateTime dateEnd = DateTime.now();
  static String customerPersonsId = '';
  static String customerPersonsName = '';

  static bool isLoading;
 
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  static List<dynamic> getData = [];
  static List<dynamic> getItem = [];
  static List<dynamic> getSalesType = [
    {'id': '301', 'name': 'Reguler'},
    {'id': '302', 'name': 'Racik'},
    {'id': '303', 'name': 'Resep'},
    {'id': '304', 'name': 'Lab'},
    {'id': '307', 'name': 'Kredit'}
  ];
  static List<dynamic> getSalesCustomer = [
    {'id': '306', 'name': 'Netto'},
    {'id': '307', 'name': 'Kredit'}
  ];
  static List<dynamic> getSalesStatus = [
    {'id':'paid', 'name': 'Lunas'},
    {'id':'credit', 'name': 'Kredit'},
    {'id':'cod', 'name': 'Cash On Delivery (COD)'},
    {'id':'consignment', 'name': 'Konsinyasi'},
  ];
  static Map getDataHeader = {};
  static Map getDataDetail = {};
  static Map getDataRecap = {};
}