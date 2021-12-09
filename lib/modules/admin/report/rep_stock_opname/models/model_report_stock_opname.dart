import 'package:jiffy/jiffy.dart';

class ModelReportStockOpname {
  static String modules = 'reportStockOpname';
  static String titlePage = 'Lap. Stok Opname';
  static String medicineId = '';
  static String medicineName = '';
  static int state = 1;
  static DateTime dateStart = DateTime.now();
  static DateTime dateEnd = Jiffy([DateTime.now().year, DateTime.now().month, DateTime.now().day]).endOf(Units.MONTH);

  static bool isLoading;
 
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  static List<dynamic> getData = [];
  static List<dynamic> getStatus = [
    {'id':'all', 'name': 'Semua'},
    {'id':'done', 'name': 'Sudah S.O'},
    {'id':'none', 'name': 'Belum S.O'},
  ];
}