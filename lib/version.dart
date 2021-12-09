import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/utility/controllers/connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Version extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ConnectionController(),
      builder: (_) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: ColorTheme.primary
              // gradient: LinearGradient(
              //   colors: [ColorTheme.primary, ColorTheme.primarySec],
              //   begin: Alignment.centerRight,
              //   end: Alignment.centerLeft,
              // ),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.28,
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
                                image: AssetImage("assets/images/background/circle_fc_md.png")
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
                                image: AssetImage("assets/images/background/dounat_fc_lg.png")
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
                                image: AssetImage("assets/images/background/dounat_fc_sm.png")
                              ),
                            ]
                          ),
                        ),
                      ),
                      Positioned(
                        top: 108,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 32),
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
                        bottom: 160,
                        left: -MediaQuery.of(context).size.width * .5 + (80*2),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/images/background/circle_fc_md.png")
                              ),
                            ]
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -24,
                        left: -MediaQuery.of(context).size.width * .5 + 40,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/images/background/dounat_fc_lg.png")
                              ),
                            ]
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 160,
                        right: -MediaQuery.of(context).size.width * .25,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/images/background/dounat_fc_sm.png")
                              ),
                            ]
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24),
                        margin: EdgeInsets.only(top: 16),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 16, bottom: 16),
                              child: Text(
                                "Versi Terbaru",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 40),
                              child: Text(
                                "v${_.storeVersion}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70
                                ),
                                textAlign: TextAlign.center,
                              )
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .5,
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
                                  "Perbarui",
                                  style: TextStyle(
                                    color: ColorTheme.primary,
                                    fontWeight: FontWeight.w600
                                  ),
                                ), 
                                onPressed: () async {
                                  print(_.appStoreLink);
                                  launch(_.appStoreLink);
                                },
                              ),
                            )
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
    );
  }
}