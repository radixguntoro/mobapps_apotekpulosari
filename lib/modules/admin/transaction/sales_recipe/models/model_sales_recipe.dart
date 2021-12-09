class ModelSalesRecipe {
  static String modules = 'trSalesRecipe';
  static String titlePage = 'Penjualan Resep';
  static String result;
  static String barcode = '';
  static double total = 0;
  static double discount = 0;
  static double payment = 0;
  static double balance = 0; 
  static double grandTotal = 0;
  static List<dynamic> medicineRecipe = [];

  static List<dynamic> getCart = [];
  static String recipeName = '';
  static double recipeTotal = 0;
  static double recipeGrandTotal = 0;
  static double recipeTuslah = 0;

  static String patient = '';
  static String address = '';
  static String doctor = '';
  static DateTime date = DateTime.now();

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