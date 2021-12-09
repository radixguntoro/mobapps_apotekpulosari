class ModelUser {
  static String modules = 'user';
  static String titlePage = 'Pengguna';
  static bool isEnable = true;
  static bool isLoading = false;
  static bool isFormEnable = false;
  static bool isValidate;
  static String result;

  static String resp;
  static String name;
  static String email;
  static String address;
  static String city;
  static String identityNumber;
  static String gender;
  static String rolesId = '2';
  static String rolesName;
  static String status;
  static String phoneId;
  static String phone;
  static String username;
  static String password;
  static String personsId;

  static Map data = {};
  static int currentPage;
  static int lastPage;
  static int totalData = 0;
  static bool maxData;
  static List<dynamic> getData = [];
  static List<dynamic> roles = [];
}