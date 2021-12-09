import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/models/model_sales_netto.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/controllers/sales_netto_controller.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesNettoRecapRepaymentScreen extends StatelessWidget {
  final SalesNettoController _salesNettoController = Get.put(SalesNettoController());
  final data;

  SalesNettoRecapRepaymentScreen(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController _valFeeDisplay = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesNetto.feeDisplay));
    final DateTime selectedDate = DateTime.now();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Pelunasan",
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
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 88),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: ColorTheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
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
                              Mdi.accountStar,
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
                                  "Pelanggan",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  TextTransform.title(data['customer']['name']),
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Form Pelunasan",
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
                                      "Tanggal",
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
                                          child: GetBuilder(
                                            init: SalesNettoController(),
                                            builder: (_) {
                                              return TextFormField(
                                                controller: TextEditingController(text: tanggal(ModelSalesNetto.customerRepaymentDate, shortMonth: true)),
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  hintText: "Pilih Tanggal..",
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
                                                onTap: () async {
                                                  final DateTime _date = await showDatePicker(
                                                    context: context,
                                                    initialDate: selectedDate,
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
                                                  _salesNettoController.setRepaymentDate(_date);
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
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
                                      "Fee Display",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12
                                      ),
                                    )
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _valFeeDisplay,
                                            textAlign: TextAlign.right,
                                            decoration: InputDecoration(
                                              hintText: "0",
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
                                            ),
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter.digitsOnly,
                                              CurrencyTextInputFormatter(
                                                locale: 'id',
                                                decimalDigits: 0,
                                                symbol: '',
                                              )
                                            ],
                                            onTap: () => _valFeeDisplay.selection = TextSelection(baseOffset: 0, extentOffset: _valFeeDisplay.value.text.length),
                                            onChanged: (val) {
                                              _salesNettoController.setFeeDisplay(val);
                                              if (val.length < 1) {
                                                _valFeeDisplay = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesNetto.feeDisplay));
                                              }
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
      floatingActionButton: GetBuilder(
        init: SalesNettoController(),
        builder: (_) {
          if (ModelSalesNetto.isLoading == true) {
            return Container();
          } else {
            return Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .40),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [ColorTheme.primary, ColorTheme.primarySec],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: FlatButton(
                child: Icon(
                  Mdi.checkAll,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                onPressed: () async{
                  Get.close(null);
                  _salesNettoController.createRepayment(data);
                  // ignore: await_only_futures
                  await _salesNettoController.readFirst();
                },
              ),
            );
          }
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}