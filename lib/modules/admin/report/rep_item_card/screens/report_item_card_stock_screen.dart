import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_filter_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_stock_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportItemCardStockScreen extends StatelessWidget {
  final ReportItemCardController _reportItemCardController = Get.put(ReportItemCardController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          _reportItemCardController.readItemStockList();
        },
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: GetBuilder(
                        init: ReportItemCardController(),
                        builder: (_) {
                          return Container(
                            height: 64,
                            color: ColorTheme.secondary,
                            padding: EdgeInsets.only(left: 16, right: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Tanggal",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportItemCard.dateStart.toString()))}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 64,
                        color: ColorTheme.third.withOpacity(0.8),
                        padding: EdgeInsets.only(left: 16, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              child: Text(
                                "Total Barang",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Container(
                              child: GetBuilder(
                                init: ReportItemCardController(),
                                builder: (resp) {
                                  if (resp.isLoading == true) {
                                    return Container(
                                      child: SpinKitThreeBounce(
                                        color: Colors.white,
                                        size: 16.0,
                                      )
                                    );
                                  } else {
                                    return Text(
                                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelReportItemCard.totalData),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  }
                                }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GetBuilder(
                      init: ReportItemCardController(),
                      builder: (resp) { 
                        return Container(
                          width: 64,
                          height: 64,
                          color: ColorTheme.third,
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            child: Icon(
                              Mdi.tune,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (ModelReportItemCard.dataItems.length < 1 || resp.isLoading == false) {
                                Get.to(ReportItemCardFilterScreen('stock_list'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                              }
                            },
                          )
                        );
                      }
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: GetBuilder(
                    init: ReportItemCardController(),
                    builder: (resp) { 
                      if (resp.isLoading == true) {
                        return LoadingShimmerRecap();
                      } else {
                        if (ModelReportItemCard.dataItems.length > 0) {
                          return SfDataGrid(
                            source: ReportItemCardStockDataScreen(ModelReportItemCard.dataItems),
                            frozenColumnsCount: 0,
                            headerRowHeight: 40,
                            rowHeight: 40,
                            gridLinesVisibility: GridLinesVisibility.none,
                            headerGridLinesVisibility: GridLinesVisibility.none,
                            headerCellBuilder: (contex, column) {
                              switch (column.mappingName) {
                                case 'number':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'No',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'id':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'SKU',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'name':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Visibility(
                                          visible: resp.sortName == null ? false : true,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 4),
                                            child: Icon(
                                              resp.sortName == 'asc' ? Mdi.arrowUp : Mdi.arrowDown,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Nama',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    )
                                  );
                                  break;
                                case 'category':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Kategori',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  );
                                  break;
                                case 'unit':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Satuan',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  );
                                  break;
                                case 'price':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Harga',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'stock':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Visibility(
                                          visible: resp.sortStock == null ? false : true,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 4),
                                            child: Icon(
                                              resp.sortStock == 'asc' ? Mdi.arrowDown : Mdi.arrowUp,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Stok',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    )
                                  );
                                  break;
                                case 'subtotal':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Subtotal',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                default:
                                  return null;
                              }
                            },
                            cellBuilder: (BuildContext context, GridColumn column, int rowIndex){
                              if (ModelReportItemCard.isLoading == true) {
                                return null;
                              } else {
                                if (rowIndex != -1) {
                                  switch (column.mappingName) {
                                    case 'number':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          ModelReportItemCard.dataItems[rowIndex]['number'].toString(),
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'id':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          ModelReportItemCard.dataItems[rowIndex]['id'].toString(),
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'name':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          ModelReportItemCard.dataItems[rowIndex]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54
                                          ),
                                        )
                                      );
                                      break;
                                    case 'category':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          ModelReportItemCard.dataItems[rowIndex]['category'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      );
                                      break;
                                    case 'unit':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          TextTransform.title(ModelReportItemCard.dataItems[rowIndex]['unit']),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      );
                                      break;
                                    case 'price':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportItemCard.dataItems[rowIndex]['price'].toString())))
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'stock':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((int.parse(ModelReportItemCard.dataItems[rowIndex]['stock'].toString())))
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'subtotal':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportItemCard.dataItems[rowIndex]['subtotal'].toString())))
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    default:
                                      return null;
                                  }
                                } else {
                                  return null;
                                }
                              }
                            },
                            columns: <GridColumn>[
                              GridWidgetColumn(
                                mappingName: 'number', 
                                headerText: 'No',
                                width: 64,
                              ),
                              GridWidgetColumn(
                                mappingName: 'id', 
                                headerText: 'SKU',
                                width: 136,
                              ),
                              GridWidgetColumn(
                                mappingName: 'name', 
                                headerText: 'Nama',
                                width: 336,
                              ),
                              GridWidgetColumn(
                                mappingName: 'category', 
                                headerText: 'Kategori',
                                width: 144,
                              ),
                              GridWidgetColumn(
                                mappingName: 'unit', 
                                headerText: 'Satuan',
                                width: 104,
                              ),
                              GridWidgetColumn(
                                mappingName: 'price', 
                                headerText: 'Harga',
                                width: 104,
                              ),
                              GridWidgetColumn(
                                mappingName: 'stock', 
                                headerText: 'Stok',
                                width: 96,
                              ),
                              GridWidgetColumn(
                                mappingName: 'subtotal', 
                                headerText: 'Subtotal',
                                width: 144,
                              ),
                            ],
                            onCellTap: (details) {
                              if (details.rowColumnIndex.rowIndex == 0) {
                                _reportItemCardController.setSortData(details.column.mappingName);
                              }
                            },
                          );
                        } else {
                          return _emptyData(context);
                        }
                      }
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }
}