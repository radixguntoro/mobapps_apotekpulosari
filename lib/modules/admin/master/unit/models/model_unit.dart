class ModelUnit {
  static String modules = 'unit';
  static String titlePage = 'Satuan';
  static String id;
  static String name;
  static String status;

  static String resp;
  static String result;

  static bool isLoading;
  static bool isValidate;

  static Map data = {};
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  static List<dynamic> getData = [];
}