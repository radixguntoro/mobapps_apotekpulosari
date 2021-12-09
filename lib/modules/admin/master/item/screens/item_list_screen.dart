import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/master/item/controllers/item_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/master/item/screens/item_create_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/item/screens/item_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/item/screens/item_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final _scrollController = ScrollController();
  final ItemController _itemController = Get.put(ItemController());

  @override
  void initState() {
    super.initState();
    _itemController.readFirst();
    _itemController.readUnitAll();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll == currentScroll) {
      print(maxScroll);
      print(currentScroll);
      _itemController.readMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Barang",
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
              borderRadius: BorderRadius.all(Radius.circular(8)),
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
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .16),
                  offset: Offset(0, -4),
                  blurRadius: 40,
                ),
              ],
            ),
            child: RefreshIndicator(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[100],
                                ),
                                child: TextFormField(
                                  readOnly: true,
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    labelText: "Pencarian",
                                    labelStyle: TextStyle(
                                      color: Colors.black54
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[200]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[100]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[200]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[200]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: "Pencarian...",
                                    hintStyle: TextStyle(
                                      color: Colors.black54
                                    ),
                                    prefixIcon: Icon(
                                      Mdi.magnify
                                    ),
                                  ),
                                  obscureText: false,
                                  onTap: () {
                                    ModelItem.getData = [];
                                    showSearch(context: context, delegate: ItemSearchScreen());
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(
                                  colors: [ColorTheme.third, ColorTheme.thirdSec],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    offset: Offset(0, 4),
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                  )
                                ]
                              ),
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Icon(
                                  Mdi.tune,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Get.bottomSheet(
                                    Container(
                                      height: MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: ListView(
                                        padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      "Filter",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: InkWell(
                                                    child: Text(
                                                      "Reset",
                                                      style: TextStyle(
                                                        color: ColorTheme.primary,
                                                        fontWeight: FontWeight.w600
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      _itemController.setResetFilter();
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 16, bottom: 16),
                                            child: DividerDashed(
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 16),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 8),
                                                  width: double.infinity,
                                                  child: Text(
                                                    "Urutkan Nama",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                ),
                                                GetBuilder(
                                                  init: ItemController(),
                                                  builder: (_) {
                                                    return Container(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(right: 8),
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: ModelItem.sortByName == 'asc' ? ColorsBase.primary[50] : Colors.white,
                                                              border: Border.all(
                                                                color: ModelItem.sortByName == 'asc' ? ColorTheme.primary : Colors.black26, 
                                                                width: 1
                                                              )
                                                            ),
                                                            child: FlatButton(
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              ),
                                                              child: Text(
                                                                "A - Z",
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: ModelItem.sortByName == 'asc' ? ColorTheme.primary : Colors.black38,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                _itemController.setSortByName('asc');
                                                              },
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: ModelItem.sortByName == 'desc' ? ColorsBase.primary[50] : Colors.white,
                                                              border: Border.all(
                                                                color: ModelItem.sortByName == 'desc' ? ColorTheme.primary : Colors.black26, 
                                                                width: 1
                                                              )
                                                            ),
                                                            child: FlatButton(
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              ),
                                                              child: Text(
                                                                "Z - A",
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: ModelItem.sortByName == 'desc' ? ColorTheme.primary : Colors.black38, 
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                _itemController.setSortByName('desc');
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 8),
                                                  width: double.infinity,
                                                  child: Text(
                                                    "Kategori",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                ),
                                                GetBuilder(
                                                  init: ItemController(),
                                                  builder: (_) {
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          WidgetSpan(
                                                            child: Container(
                                                              height: 32,
                                                              margin: EdgeInsets.only(bottom: 8, right: 8),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                border: _.filterOtc == false ? Border.all(color: Colors.black26, width: 1) : Border.all(color: ColorTheme.primary, width: 1),
                                                                color: _.filterOtc == false ? Colors.white : ColorsBase.primary[50],
                                                              ),
                                                              child: FlatButton(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                ),
                                                                child: Text(
                                                                  "OTC/Bebas",
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    color: _.filterOtc == false ? Colors.black38 : ColorTheme.primary
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  _itemController.setFilterCategory(_.filterOtc, '1002000005');
                                                                },
                                                              ),
                                                            )
                                                          ),
                                                          WidgetSpan(
                                                            child: Container(
                                                              margin: EdgeInsets.only(bottom: 8, right: 8),
                                                              height: 32,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                border: _.filterPsiko == false ? Border.all(color: Colors.black26, width: 1) : Border.all(color: ColorTheme.primary, width: 1),
                                                                color: _.filterPsiko == false ? Colors.white : ColorsBase.primary[50],
                                                              ),
                                                              child: FlatButton(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                ),
                                                                child: Text(
                                                                  "Psikotropika/NAPZA",
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    color: _.filterPsiko == false ? Colors.black38 : ColorTheme.primary
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  _itemController.setFilterCategory(_.filterPsiko, '1002000003');
                                                                },
                                                              ),
                                                            )
                                                          ),
                                                          WidgetSpan(
                                                            child: Container(
                                                              height: 32,
                                                              margin: EdgeInsets.only(bottom: 8, right: 8),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                border: _.filterVens == false ? Border.all(color: Colors.black26, width: 1) : Border.all(color: ColorTheme.primary, width: 1),
                                                                color: _.filterVens == false ? Colors.white : ColorsBase.primary[50],
                                                              ),
                                                              child: FlatButton(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                ),
                                                                child: Text(
                                                                  "Vens/Keras",
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    color: _.filterVens == false ? Colors.black38 : ColorTheme.primary
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  _itemController.setFilterCategory(_.filterVens, '1002000004');
                                                                },
                                                              ),
                                                            )
                                                          ),
                                                          WidgetSpan(
                                                            child: Container(
                                                              margin: EdgeInsets.only(bottom: 8, right: 8),
                                                              height: 32,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                border: _.filterStik == false ? Border.all(color: Colors.black26, width: 1) : Border.all(color: ColorTheme.primary, width: 1),
                                                                color: _.filterStik == false ? Colors.white : ColorsBase.primary[50],
                                                              ),
                                                              child: FlatButton(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                ),
                                                                child: Text(
                                                                  "Stik",
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    color: _.filterStik == false ? Colors.black38 : ColorTheme.primary
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  _itemController.setFilterCategory(_.filterStik, '1002000002');
                                                                },
                                                              ),
                                                            )
                                                          ),
                                                          WidgetSpan(
                                                            child: Container(
                                                              height: 32,
                                                              margin: EdgeInsets.only(bottom: 8, right: 8),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8),
                                                                border: _.filterPrek == false ? Border.all(color: Colors.black26, width: 1) : Border.all(color: ColorTheme.primary, width: 1),
                                                                color: _.filterPrek == false ? Colors.white : ColorsBase.primary[50],
                                                              ),
                                                              child: FlatButton(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                ),
                                                                child: Text(
                                                                  "Prekusor",
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    color: _.filterPrek == false ? Colors.black38 : ColorTheme.primary
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  _itemController.setFilterCategory(_.filterPrek, '1002000001');
                                                                },
                                                              ),
                                                            )
                                                          ),
                                                        ]
                                                      ),
                                                    );
                                                  }
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 16),
                                            width: MediaQuery.of(context).size.width,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 8),
                                                  width: double.infinity,
                                                  child: Text(
                                                    "Satuan",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: SingleChildScrollView(
                                                    scrollDirection: Axis.horizontal,
                                                    child: Row(
                                                      children: [
                                                        for (var item in ModelItem.getUnit)
                                                          GetBuilder(
                                                            init: ItemController(),
                                                            builder: (_) {
                                                              return Container(
                                                                height: 32,
                                                                margin: EdgeInsets.only(bottom: 8, right: 8),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(8),
                                                                  border: Border.all(
                                                                    color: _.filterUnit.contains(item['id']) == false ? ColorTheme.primary : Colors.black26, 
                                                                    width: 1
                                                                  ),
                                                                  color: _.filterUnit.contains(item['id']) == false ? ColorsBase.primary[50] : Colors.white,
                                                                ),
                                                                child: FlatButton(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                  ),
                                                                  child: Text(
                                                                    TextTransform.title(item['name']),
                                                                    style: TextStyle(
                                                                      fontSize: 12,
                                                                      color: _.filterUnit.contains(item['id']) == false ? ColorTheme.primary : Colors.black38,
                                                                    ),
                                                                  ),
                                                                  onPressed: () {
                                                                    _itemController.setFilterUnit(item['id']);
                                                                  },
                                                                ),
                                                              );
                                                            }
                                                          )
                                                      ]
                                                    ),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: GetBuilder(
                                init: ItemController(),
                                builder: (_) {
                                  return Text(
                                    "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelItem.totalData))} data",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: GetBuilder(
                          init: ItemController(),
                          builder: (resp) {
                            if (ModelItem.isLoading == true) {
                              return LoadingShimmer();
                            } else {
                              if(ModelItem.getData.length > 0) {
                                return ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  itemCount: ModelItem.maxData ? ModelItem.getData.length : ModelItem.getData.length + 1,
                                  controller: _scrollController,
                                  itemBuilder: (context, int i) {
                                    return i < ModelItem.getData.length ? ItemDataScreen(ModelItem.getData[i], i) : Container();
                                  }
                                );
                              } else {
                                return _emptyData(context);
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onRefresh: () async {
                _itemController.readFirst();
              },
            ),
          ),
        ]
      ),
      floatingActionButton: Visibility(
        visible: ModelAuth.permission == 99 || ModelAuth.permission == 1 ? true : false,
        child: FloatingActionButton(
          onPressed: () async{
            _itemController.clearInput();
            _itemController.readCategoryAll();
            _itemController.readUnitAll();
            _itemController.readSupplierAll();
            Get.to(ItemCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
          },
          child: Container(
            width: 56,
            height: 56,
            child: Icon(
              Mdi.plus,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [ColorTheme.primary, ColorTheme.primarySec],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }
}