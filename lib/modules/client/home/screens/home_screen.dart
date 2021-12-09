import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/client/home/controllers/home_controller.dart';
import 'package:apotik_pulosari/modules/client/home/models/model_home.dart';
import 'package:apotik_pulosari/modules/client/home/screens/home_medicine_item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final int permission;
  final int personsId;

  HomeScreen(
    this.username, 
    this.permission, 
    this.personsId
  );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _homeController.readMedicineFirst();
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
      _homeController.readMedicineMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Apotek Pulosari",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        leading: Container(),
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .16),
                  offset: Offset(0, -4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8),
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
                                        labelText: "Apa yang anda inginkan?",
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
                                        hintText: "Apa yang anda inginkan?",
                                        hintStyle: TextStyle(
                                          color: Colors.black54
                                        ),
                                        prefixIcon: Icon(
                                          Mdi.magnify,
                                          color: Colors.black38
                                        ),
                                      ),
                                      obscureText: false,
                                      onTap: () {
                                        // ModelSalesRegular.getData = [];
                                        // showSearch(context: context, delegate: SalesRegularRecapSearchScreen());
                                      },
                                    ),
                                  ),
                                ), 
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                          color: Colors.white,
                          child: GetBuilder(
                            init: HomeController(),
                            builder: (resp) {
                              return Text(
                                "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(resp.totalData)} data",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12
                                ),
                              );
                            }
                          ),
                        ),//
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: GetBuilder(
                        init: HomeController(),
                        builder: (resp) {
                          if (resp.isLoadingMedicines == true) {
                            return LoadingShimmer();
                          } else {
                            if(resp.dataMedicines.length > 0){
                              return GridView.builder(
                                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: .825,
                                ),
                                controller: _scrollController,
                                padding: EdgeInsets.all(16),
                                itemCount: resp.maxData ? resp.dataMedicines.length : resp.dataMedicines.length + 1,
                                itemBuilder: (context, int i) {
                                  return i < resp.dataMedicines.length ? HomeMedicineItemScreen(resp.dataMedicines[i], i) : Container();
                                },
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
          ),
        ]
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[100],
        child: BottomAppBar(
          color: Colors.grey[100],
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Container(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          padding: EdgeInsets.all(0),
                          child: Icon(
                            ModelHome.setPos == 0 ? Mdi.home : Mdi.homeOutline,
                            color: Colors.black38
                          ), 
                          onPressed: () { 
                            
                          },
                        ),
                      ),
                      Container(
                        child: Text(
                          "Beranda",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black38
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          padding: EdgeInsets.all(0),
                          child: Icon(
                            ModelHome.setPos == 1 ? Mdi.heart : Mdi.heartOutline,
                            color: Colors.black38
                          ), 
                          onPressed: () { 
                            
                          },
                        ),
                      ),
                      Container(
                        child: Text(
                          "Wishlist",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black38
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          padding: EdgeInsets.all(0),
                          child: Icon(
                            ModelHome.setPos == 2 ? Mdi.cart : Mdi.cartOutline,
                            color: Colors.black38
                          ), 
                          onPressed: () { 
                            
                          },
                        ),
                      ),
                      Container(
                        child: Text(
                          "Keranjang",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black38
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          padding: EdgeInsets.all(0),
                          child: Icon(
                            ModelHome.setPos == 3 ? Mdi.fileDocument : Mdi.fileDocumentOutline,
                            color: Colors.black38
                          ), 
                          onPressed: () { 
                            
                          },
                        ),
                      ),
                      Container(
                        child: Text(
                          "Order",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black38
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          padding: EdgeInsets.all(0),
                          child: Icon(
                            ModelHome.setPos == 4 ? Mdi.account : Mdi.accountOutline,
                            color: Colors.black38
                          ), 
                          onPressed: () { 
                            
                          },
                        ),
                      ),
                      Container(
                        child: Text(
                          "Akun",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black38
                          ),
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
    );
  }

  Widget _emptyData(context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              "Oops!",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 56),
            child: Text(
              "Data masih kosong",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54
              ),
            ),
          ),
          Container(
            child: Image(
              width: 200,
              image: AssetImage("assets/images/emptydata.png"),
            ),
          ),
        ],
      ),
    );
  }
}
