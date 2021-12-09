class ModelCategory {
  static String modules = 'category';
  static String titlePage = 'Kategori';
  static String id;
  static String name;

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