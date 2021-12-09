import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/controllers/sales_recipe_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/models/model_sales_recipe.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/screens/sales_recipe_cart_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SalesRecipeCreateScreen extends StatelessWidget {
  final SalesRecipeController _salesRecipeController = Get.put(SalesRecipeController());
  final DateTime setDate = DateTime.now();
  final TextEditingController _valPatientName = TextEditingController(text: ModelSalesRecipe.patient);
  final TextEditingController _valPatientAddress = TextEditingController(text: ModelSalesRecipe.address);
  final TextEditingController _valDoctorName = TextEditingController(text: ModelSalesRecipe.doctor);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _salesRecipeController.readFirst();
        _salesRecipeController.clearForm();
        Get.close(null);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Form Pasien",
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
                _salesRecipeController.readFirst();
                _salesRecipeController.clearForm();
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24), 
                    topRight: Radius.circular(24)
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                        child: Form(
                          child: GetBuilder(
                            init: SalesRecipeController(),
                            builder: (resp) {
                              return ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 8),
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Informasi Pasien",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 16, bottom: 16),
                                    color: Colors.white,
                                    child: DividerDashed(
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Nama",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: TextFormField(
                                            controller: _valPatientName,
                                            textCapitalization: TextCapitalization.words,
                                            decoration: InputDecoration(
                                              hintText: "Isikan nama pasien...",
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                              disabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[200]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              suffixIcon: Icon(Mdi.accountHeart)
                                            ),
                                            onChanged: (value) => {
                                              ModelSalesRecipe.patient = value
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Alamat",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: TextFormField(
                                            controller: _valPatientAddress,
                                            decoration: InputDecoration(
                                              hintText: "Isikan alamat pasien...",
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                              disabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[200]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              suffixIcon: Icon(Mdi.mapMarker)
                                            ),
                                            onChanged: (value) => {
                                              ModelSalesRecipe.address = value
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Dokter",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: TextFormField(
                                            controller: _valDoctorName,
                                            decoration: InputDecoration(
                                              hintText: "Isikan nama dokter...",
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                              disabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[200]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              suffixIcon: Icon(Mdi.doctor)
                                            ),
                                            onChanged: (value) => {
                                              ModelSalesRecipe.doctor = value
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Tanggal Resep",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TextEditingController(text: tanggal(ModelSalesRecipe.date, shortMonth: true)),
                                                  enabled: false,
                                                  decoration: InputDecoration(
                                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                                    contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                    disabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey[200]),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey[300]),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey[300]),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    suffixIcon: Icon(Mdi.calendar)
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 48,
                                                height: 48,
                                                margin: EdgeInsets.only(left: 16),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                  gradient: LinearGradient(
                                                    colors: [ColorTheme.third, ColorTheme.thirdSec],
                                                    begin: Alignment.centerRight,
                                                    end: Alignment.centerLeft,
                                                  ),
                                                ),
                                                child: FlatButton(
                                                  padding: EdgeInsets.all(0),
                                                  child: Icon(
                                                    Mdi.calendarSearch,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () async {
                                                    final DateTime _date = await showDatePicker(
                                                      context: context,
                                                      initialDate: setDate,
                                                      firstDate: DateTime(2020),
                                                      lastDate: DateTime(2025),
                                                      cancelText: "Tutup",
                                                      confirmText: "Pilih",
                                                      builder: (context, child) {
                                                        return Theme(
                                                          data: ThemeData.light().copyWith(
                                                            colorScheme: ColorScheme.light(
                                                              primary: ColorTheme.primary,
                                                            ),
                                                            buttonTheme: ButtonThemeData(
                                                              textTheme: ButtonTextTheme.primary
                                                            ),
                                                          ),
                                                          child: child,
                                                        );
                                                      },
                                                    );
                                                    _salesRecipeController.setRecipeDate(_date);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16),
          color: ColorsBase.primary[10],
          width: MediaQuery.of(context).size.width,
          child: GetBuilder(
            init: SalesRecipeController(),
            builder: (resp) {
              return ModelSalesRecipe.patient != '' ? _buttonEnable(context) : _buttonDisable(context);
            }
          ),
        ),
      ),
    );
  }

  Widget _buttonEnable(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [ColorTheme.primary, ColorTheme.primarySec],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsBase.primary.withOpacity(0.40),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              child: Text(
                "Keranjang",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Icon(
              Mdi.arrowRight,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () async {
          // ignore: await_only_futures
          Get.off(SalesRecipeCartListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        },
      ),
    );
  }

  Widget _buttonDisable(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        highlightColor: null,
        splashColor: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              child: Text(
                "Keranjang",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Icon(
              Mdi.arrowRight,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () async {
          
        },
      ),
    );
  }
}
