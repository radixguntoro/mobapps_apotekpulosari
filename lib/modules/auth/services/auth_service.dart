import 'dart:convert';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class AuthService {
  GetStorage box = GetStorage();
  static String modules = 'auth';
  String username;
  String password;
  String personsId;

  AuthService({this.username, this.personsId, this.password});

  factory AuthService.createItem(Map<String, dynamic> val) {
    return AuthService(
      username: val['username'],
      personsId: val['persons_id'],
    );
  }

  // static Future<String> signInWithGoogle() async {
  //   GetStorage box = GetStorage();

  //   await Firebase.initializeApp();

  //   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );

  //   final UserCredential authResult =
  //       await _auth.signInWithCredential(credential);
  //   final User user = authResult.user;
  //   print("ini aku Hallo");

  //   if (user != null) {
  //     assert(!user.isAnonymous);
  //     var token = await user.getIdToken();
  //     assert(token != null);
  //     assert(user.email != null);
  //     assert(user.displayName != null);
  //     assert(user.photoURL != null);

  //     final User currentUser = _auth.currentUser;
  //     assert(user.uid == currentUser.uid);

  //     var data = json.encode({
  //       'email': user.email,
  //       'client_id': user.uid,
  //       'username': user.displayName,
  //       'secret': "d7Mqt6NKmORifVb3PW4n"
  //     });

  //     // var tes = json.encode(data);
  //     print("ini aku profilku $data");
  //     // uid = await currentUser.getIdToken(true);
  //     print("signInWithGoogle succeeded: $token");

  //     // SharedPreferences prefs = await SharedPreferences.getInstance();
  //     print("ini linknya ${Api.route[modules]['googlelogin']}");
  //     final request = await http.post(
  //       Api.route[modules]['googlelogin'],
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: data,
  //     );
  //     var resp = json.decode(request.body);
  //     print("Hasil Login $resp");
  //     if (resp['status'] == 1) {
  //       box.write('username', resp['username']);
  //       box.write('permission', resp['permission']);
  //       box.write('persons_id', resp['persons_id']);
  //       box.write('token', resp['token']);
  //       return "success";
  //     } else {
  //       await googleSignIn.signOut();
  //       print("gagal $resp");
  //       return "failed";
  //     }
  //   }
  // }

  // return "failed";
  // }

  static Future<String> signIn(username, password) async {
    GetStorage box = GetStorage();
    var data = {
      'username': username,
      'password': password,
    };

    try {
      final request = await http.post(
        Api.route[modules]['login'],
        body: data,
      );
      var resp = json.decode(request.body);
      print("Hasil Login $resp");
      if (resp['status'] == 1) {
        box.write('username', resp['username']);
        box.write('permission', resp['permission']);
        box.write('persons_id', resp['persons_id']);
        box.write('date', DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)));
        box.write('token', resp['token']);
        return "success";
      } else {
        return "failed";
      }
    } catch (e) {
      // await googleSignIn.signOut();
      print(e.toString());
      return "failed";
    }
  }

  static Future<String> signOut() async {
    // await googleSignIn.signOut();
    try {
      final request = await http.post(
        Api.route[modules]['logout'],
      );
      var resp = json.decode(request.body);
      return resp;
    } catch (e) {
      print(e.toString());
      return "failed";
    }
  }
}
