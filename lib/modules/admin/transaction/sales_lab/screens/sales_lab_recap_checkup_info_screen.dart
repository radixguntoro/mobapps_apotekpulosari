import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class SalesLabRecapCheckUpInfoScreen extends StatelessWidget {
  final data;

  SalesLabRecapCheckUpInfoScreen(
    this.data
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Hasil Lab",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        leading: Container(
          width: 56,
          height: 56,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(
              Mdi.chevronLeft,
              size: 24,
              color: Colors.white,
            ),
            onPressed: () {
              Get.close(null);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Container(
            child: Container(
              margin: EdgeInsets.only(right: 16, left: 8),
              width: 32,
              height: 32,
              child: null,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorTheme.primary, ColorTheme.primarySec],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: Stack(
              children: <Widget>[
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
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 88),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .08),
                  offset: Offset(0, 4),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), 
                  topRight: Radius.circular(24)
                ),
                color: ColorsBase.primary[10],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 48,
                          height: 48,
                          padding: EdgeInsets.all(6),
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Mdi.accountHeart,
                              size: 24,
                              color: ColorsBase.secondary[25],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "Pasien",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  data['patient'] == null || data['patient'] == '' ? "Tidak Ada Nama" : TextTransform.title(data['patient']),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24), 
                          topRight: Radius.circular(24)
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Tabel Pemeriksaan",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 16, bottom: 8),
                            color: Colors.white,
                            child: DividerDashed(
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      color: Colors.white,
                      child: ListView(
                        padding: EdgeInsets.all(0),
                        children: [
                          Container(
                            child: Table(
                              border: TableBorder.all(
                              color: Colors.grey[200], width: 1, style: BorderStyle.solid),
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Text(
                                          "PEMERIKSAAN",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Text(
                                          "HASIL LAB",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100]
                                  ),
                                  children: [
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Text(
                                          "Glucosa Puasa",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Nilai: ${data['glucosa_fasting'] != '' ? data['glucosa_fasting'] : '-'}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Normal: 75-110 md/dL",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 10
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100]
                                  ),
                                  children: [
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Text(
                                          "Glucosa 2 Jam PP",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Nilai: ${data['glucosa_2hours_pp'] != '' ? data['glucosa_2hours_pp'] : '-'}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Normal: < 125 md/dL",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 10
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Text(
                                          "Glucosa Acak",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Nilai: ${data['glucosa_random'] != '' ? data['glucosa_random'] : '-'}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Normal: < 140 md/dL",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 10
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100]
                                  ),
                                  children: [
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Text(
                                          "Asam Urat",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Nilai: ${data['glucosa_random'] != '' ? data['glucosa_random'] : '-'}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Normal P: 2.4 - 5.7 md/dL",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 10
                                              ),
                                            ),
                                            Text(
                                              "Normal L: 3.4 - 7.0 md/dL",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 10
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100]
                                  ),
                                  children: [
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Text(
                                          "Cholesterol",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Nilai: ${data['cholesterol'] != '' ? data['cholesterol'] : '-'}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Normal: < 200 md/dL",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 10
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  children: [
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Text(
                                          "Tekanan Darah",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Nilai: ${data['blood_pressure'] != '' ? data['blood_pressure'] : '-'}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}