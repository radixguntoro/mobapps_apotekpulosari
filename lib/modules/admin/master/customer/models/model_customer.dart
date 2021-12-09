class ModelCustomer {
  static String modules = 'customer';
  static String titlePage = 'Pelanggan';
  static String result;

  static String resp;
  static String name;
  static String address;
  static String city;
  static String identityNumber;
  static String status;
  static String phoneId;
  static String phone;
  static String personsId;

  static bool isLoading;
  static bool isValidate;

  static Map data = {};
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  static List<dynamic> getData = [];
}