import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/controllers/sales_recipe_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/screens/sales_recipe_cart_ingredients_list_screen.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesRecipeCartItemScreen extends StatelessWidget {
  final SalesRecipeController _salesRecipeController = Get.put(SalesRecipeController());
  final item;
  final index;

  SalesRecipeCartItemScreen(
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController _valItemQty = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(item['qty']));
    TextEditingController _valItemTuslah = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['tuslah'].toString())));

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Icon(
                    item['status_mix'] == 'mix' ? Mdi.nutrition : Mdi.pill,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 8),
                                child: RichText(
                                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Text(
                                          item['medicineRecipeName'].toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: item['status_mix'] == 'mix' ? Container(
                                          margin: EdgeInsets.only(left: 4),
                                          width: 18,
                                          height: 18,
                                          child: FlatButton(
                                            padding: EdgeInsets.all(0),
                                            child: Icon(
                                              Mdi.informationOutline,
                                              color: ColorTheme.secondary,
                                              size: 18,
                                            ),
                                            onPressed: () => {
                                              Get.to(SalesRecipeCartIngredientsListScreen(item), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),)
                                            },
                                          )
                                        ) : Container(),
                                      )
                                    ]
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Icon(
                                  Mdi.delete,
                                  size: 24,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  _salesRecipeController.deleteRecipe(index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 8),
                                      margin: EdgeInsets.only(bottom: 6),
                                      child: Text(
                                        item['status_mix'] == 'nonmix' ? "Non Racik" : "Racik",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: Text(
                                        NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(item['price'].toString())),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      "Tuslah",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  GetBuilder(
                                    init: SalesRecipeController(),
                                    builder: (resp) {
                                      return Container(
                                        child: Text(
                                          NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(item['tuslah'].toString())),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      );
                                    }
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Subtotal",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      GetBuilder(
                        init: SalesRecipeController(),
                        builder: (resp) {
                          return Container(
                            child: Text(
                              NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(item['subtotal'].toString())),
                              style: TextStyle(
                                color: ColorTheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item['status_mix'] == 'mix' ? [] : <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Kuantitas",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      GetBuilder(
                        init: SalesRecipeController(),
                        builder: (resp) {
                          return Container(
                            child: Text(
                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(item['qty']),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item['status_mix'] == 'mix' ? [] : <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Sisa Stok",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(item['qty_total'])),
                          style: TextStyle(
                            color: int.parse(item['qty_total']) > 0 ? Colors.black :ColorTheme.danger,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                item['status_mix'] == 'mix' ? Container() : Container(
                  width: 32,
                  height: 32,
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
                      Mdi.circleEditOutline,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () async {
                      Get.bottomSheet(
                        Container(
                          // height: 336,
                          padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            color: Colors.white,
                          ),
                          child: GetBuilder(
                            init: SalesRecipeController(),
                            builder: (resp) {
                              return ListView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Kuantitas",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _valItemQty,
                                            textAlign: TextAlign.right,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CurrencyTextInputFormatter(
                                                locale: 'id',
                                                decimalDigits: 0,
                                                symbol: '',
                                              )
                                            ],
                                            decoration: InputDecoration(
                                              hintText: item['qty'].toString(),
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
                                            onTap: () async => _valItemQty.selection = TextSelection(baseOffset: 0, extentOffset: _valItemQty.value.text.length),
                                            onChanged: (val) async{
                                              // ignore: await_only_futures
                                              _salesRecipeController.setQtyCartMix(item, val);
                                              if (val.length < 1) {
                                                _valItemQty = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(item['qty']));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 24),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Tuslah",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _valItemTuslah,
                                            textAlign: TextAlign.right,
                                            enabled: true,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CurrencyTextInputFormatter(
                                                locale: 'id',
                                                decimalDigits: 0,
                                                symbol: '',
                                              )
                                            ],
                                            decoration: InputDecoration(
                                              hintText: item['price'].toString(),
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
                                            onTap: () async => _valItemTuslah.selection = TextSelection(baseOffset: 0, extentOffset: _valItemTuslah.value.text.length),
                                            onChanged: (val) async{
                                              _salesRecipeController.calcTuslah(item, val);
                                              // ignore: await_only_futures
                                              if (val.length < 1) {
                                                _valItemTuslah = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['tuslah']).toString()));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}