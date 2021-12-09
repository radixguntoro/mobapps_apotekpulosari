import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/validation/form_controller.dart';
import 'package:apotik_pulosari/modules/auth/controllers/auth_controller.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:mdi/mdi.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>[
//     'email',
//   ],
// );

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 1.5;
  final AuthController _authController = Get.put(AuthController());
  final FormController _formController = Get.put(FormController());
  // final version;

  // LoginScreen(
  //   this.version
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [ColorTheme.primary, ColorTheme.primarySec],
          //   begin: Alignment.centerRight,
          //   end: Alignment.centerLeft,
          // ),
          color: ColorTheme.primary,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  Positioned(
                    top: -24,
                    left: -MediaQuery.of(context).size.width * .5 + 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/background/circle_fc_lg.png")
                          ),
                        ]
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -MediaQuery.of(context).size.width * .5 + 64,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage(
                              "assets/images/background/circle_fc_md.png"
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                  Positioned(
                    top: -24,
                    right: -MediaQuery.of(context).size.width * .5 + 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage(
                              "assets/images/background/dounat_fc_lg.png"
                            )
                          ),
                        ]
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: -MediaQuery.of(context).size.width * .25,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage(
                              "assets/images/background/dounat_fc_sm.png"
                            )
                          ),
                        ]
                      ),
                    ),
                  ),
                  Positioned(
                    top: 128,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 24),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              shape: BoxShape.circle
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              width: 88,
                              height: 88,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: ColorTheme.primary,
                                shape: BoxShape.circle
                              ),
                              child: Container(
                                child: Image(
                                  image: AssetImage("assets/images/logo.png"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            )
                          ),
                          // Container(
                          //   width: 102,
                          //   height: 102,
                          //   padding: EdgeInsets.all(24),
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: Colors.white10,
                          //   ),
                          //   child: Image(
                          //     image: AssetImage("assets/images/logo.png")
                          //   ),
                          // )
                        ]
                      ),
                    ),
                  ),
                ]
              ),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned(
                    bottom: -24,
                    right: -MediaQuery.of(context).size.width * .5 + 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: <Widget>[
                        Image(
                            image: AssetImage(
                                "assets/images/background/circle_fc_lg.png")),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 160,
                    left: -MediaQuery.of(context).size.width * .5 + (80 * 2),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: <Widget>[
                        Image(
                            image: AssetImage(
                                "assets/images/background/circle_fc_md.png")),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: -24,
                    left: -MediaQuery.of(context).size.width * .5 + 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: <Widget>[
                        Image(
                            image: AssetImage(
                                "assets/images/background/dounat_fc_lg.png")),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 160,
                    right: -MediaQuery.of(context).size.width * .25,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: <Widget>[
                        Image(
                          image: AssetImage(
                            "assets/images/background/dounat_fc_sm.png"
                          )
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: ListView(
                      padding: EdgeInsets.only(
                        top: 16, bottom: 24, left: 24, right: 24
                      ),
                      children: <Widget>[
                        GetBuilder<AuthController>(
                          init: AuthController(),
                          builder: (_) {
                            return Visibility(
                              visible: _.isEmptyForm == false ? false : true,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(bottom: 24),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // border: Border.all(color: ColorTheme.danger),
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: Icon(
                                        Mdi.closeCircle,
                                        size: 24,
                                        color: ColorTheme.danger,
                                      ),
                                    ),
                                    Text(
                                      "Username dan Password harus diisi",
                                      style: TextStyle(
                                        color: ColorTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        ),
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 24),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: TextFormField(
                                            enabled: ModelAuth.isEnable,
                                            initialValue: ModelAuth.username,
                                            style: TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(18),
                                              labelText: "Username",
                                              labelStyle: TextStyle(
                                                color: Colors.white
                                              ),
                                              floatingLabelBehavior: FloatingLabelBehavior.never,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white10
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              hintText: "Masukkan username...",
                                              hintStyle: TextStyle(
                                                color: Colors.white70
                                              ),
                                              suffixIcon: Padding(
                                                child: Icon(
                                                  Mdi.accountCircle,
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.all(12)
                                              ),
                                            ),
                                            validator: (String value) {
                                              if (value.isEmpty) {
                                                return 'Username tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              ModelAuth.username = val;
                                            },
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 24),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: GetBuilder<FormController>(
                                          init: FormController(),
                                          builder: (resp) {
                                            if (FormController.isObscure ==
                                                true) {
                                              return _iconBtnObsDisable();
                                            }
                                            return _iconBtnObsEnable();
                                          },
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: GetBuilder<AuthController>(
                            init: AuthController(),
                            builder: (_) {
                              if (_.isLoading == true) {
                                return _btnLoading();
                              }
                              return _btnLogin(context);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          child: Center(
                            child: Text(
                              "v60.${DateFormat('yy').format(DateTime.now())}",
                              style: TextStyle(
                                color: Colors.white54
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnLogin(context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (_) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: Offset(0, 4),
                    blurRadius: 16,
                    spreadRadius: 0,
                  )
                ]
              ),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: ColorTheme.primary, 
                    fontWeight: FontWeight.w600
                  ),
                ),
                onPressed: () async {
                  _authController.signIn();
                  if (_.authStatus == 'loggedIn') {
                    Get.offAll(Wrapper());
                  }
                },
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 48,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.08),
            //           offset: Offset(0, 4),
            //           blurRadius: 16,
            //           spreadRadius: 0,
            //         )
            //       ]),
            //   child: FlatButton(
            //     padding: EdgeInsets.all(0),
            //     child: Text(
            //       "Sign In with Google",
            //       style: TextStyle(
            //           color: ColorTheme.primary, fontWeight: FontWeight.w600),
            //     ),
            //     onPressed: () async {
            //       _authController.GooglesignIn();
            //       if (_.authStatus == 'loggedIn') {
            //         Get.offAll(Wrapper());
            //       }
            //     },
            //   ),
            // ),
          ],
        );
      }
    );
  }

  Widget _btnLoading() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), 
        color: Colors.white
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Container(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(ColorTheme.primary),
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _iconBtnObsEnable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        initialValue: ModelAuth.password,
        enabled: ModelAuth.isEnable,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
          labelText: "Password",
          labelStyle: TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white10),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: "Masukkan password...",
          hintStyle: TextStyle(color: Colors.white70),
          suffixIcon: IconButton(
            padding: EdgeInsets.all(0),
            color: Colors.white,
            icon: Icon(Mdi.eyeOff),
            onPressed: () {
              bool isObscure = true;
              _formController.textObscure(isObscure);
            }
          ),
        ),
        obscureText: false,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password tidak boleh kosong';
          }
          return null;
        },
        onChanged: (val) {
          ModelAuth.password = val;
        },
      ),
    );
  }

  Widget _iconBtnObsDisable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        initialValue: ModelAuth.password,
        enabled: ModelAuth.isEnable,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
          labelText: "Password",
          labelStyle: TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white10),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: "Masukkan password...",
          hintStyle: TextStyle(color: Colors.white70),
          suffixIcon: IconButton(
            padding: EdgeInsets.all(0),
            color: Colors.white,
            icon: Icon(Mdi.eye),
            onPressed: () {
              bool isObscure = false;
              _formController.textObscure(isObscure);
            }
          ),
        ),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password tidak boleh kosong';
          }
          return null;
        },
        onChanged: (val) {
          ModelAuth.password = val;
        },
      ),
    );
  }
}
