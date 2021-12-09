import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Sukses!",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Data berhasil disimpan.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .75,
                      margin: EdgeInsets.only(bottom: 16),
                      child: Image(
                        image: AssetImage("assets/images/icons/resp_page/success.png"),
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .5,
                          height: 48,
                          // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Text(
                                  "Selesai",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () async {
                          Get.close(null);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}