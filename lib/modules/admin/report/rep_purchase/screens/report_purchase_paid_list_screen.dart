import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_filter_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_paid_list_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_recap_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportPurchasePaidListScreen extends StatelessWidget {
  final ReportPurchaseController _reportPurchaseController = Get.put(ReportPurchaseController());
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          _reportPurchaseController.readFirst();
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
                        init: ReportPurchaseController(),
                        builder: (_) {
                          ModelReportPurchase.dateStart = ModelReportPurchase.dateStart == null ? DateTime.now() : ModelReportPurchase.dateStart;
                          ModelReportPurchase.dateEnd = ModelReportPurchase.dateEnd == null ? DateTime.now() : ModelReportPurchase.dateEnd;
                          return Container(
                            height: 64,
                            color: ColorTheme.secondary,
                            child: FlatButton(
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
                                          Stack(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(bottom: 6),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          ModelReportPurchase.supplierPersonsName == '' ? 'SEMUA SUPPLIER' : ModelReportPurchase.supplierPersonsName,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            child: Text(
                                              "${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(ModelReportPurchase.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(ModelReportPurchase.dateEnd.toString()))}",
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
                              onPressed: () async {
                                final List<DateTime> picked = await DateRangePicker.showDatePicker(
                                  context: context,
                                  initialFirstDate: ModelReportPurchase.dateStart,
                                  initialLastDate: ModelReportPurchase.dateEnd,
                                  // initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                                  firstDate: new DateTime(2020, 12, 26),
                                  lastDate: new DateTime.now(),
                                  locale: const Locale("id","ID"),
                                );
                                if (picked != null && picked.length == 2) {
                                  _reportPurchaseController.setDate(picked, 'dateRange');
                                }
                              },
                            ),
                          );
                        }
                      ),
                    ),
                    Container(
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
                          Get.to(ReportPurchaseFilterScreen('', '', 'paid_list'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                        },
                      )
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 64,
                        color: ColorTheme.third,
                        padding: EdgeInsets.only(left: 16, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              child: Text(
                                "Total Retur",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Container(
                              child: GetBuilder(
                                init: ReportPurchaseController(),
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
                                      "0",
                                      // NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(ModelReportPurchase.getDataPaidHeaderPaid['total_return'].toString())),
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
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 64,
                        color: ColorsBase.primary[50],
                        padding: EdgeInsets.only(left: 16, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              child: Text(
                                "Total Pembelian",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Container(
                              child: GetBuilder(
                                init: ReportPurchaseController(),
                                builder: (resp) {
                                  if (resp.isLoading == true) {
                                    return Container(
                                      child: SpinKitThreeBounce(
                                        color: Colors.black,
                                        size: 16.0,
                                      )
                                    );
                                  } else {
                                    return Text(
                                      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(ModelReportPurchase.getDataHeaderPaid['total_purchase'].toString())),
                                      style: TextStyle(
                                        color: Colors.black,
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
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: GetBuilder(
                    init: ReportPurchaseController(),
                    builder: (resp) {
                      if (resp.isLoading == true) {
                        return LoadingShimmerRecap();
                      } else {
                        if(ModelReportPurchase.getDataPaid.length > 0){
                          return SfDataGrid(
                            source: ReportPurchasePaidListDataScreen(ModelReportPurchase.getDataPaid),
                            frozenColumnsCount: 0,
                            headerRowHeight: 40,
                            rowHeight: 40,
                            gridLinesVisibility: GridLinesVisibility.none,
                            headerGridLinesVisibility: GridLinesVisibility.none,
                            headerCellBuilder: (contex, column) {
                              switch (column.mappingName) {
                                case 'date':
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
                                      'Tanggal',
                                      textAlign: TextAlign.start,
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
                                      'No. Transaksi',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'supplier':
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
                                      'Supplier',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'invoice_number':
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
                                      'No. Faktur',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'status':
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
                                      'Status',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'cashier':
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
                                      'Kasir',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'total':
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
                                      'Total',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'discount':
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
                                      'Diskon',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
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
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'ppn':
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
                                    alignment: Alignment.center,
                                    child: Text(
                                      'PPN',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'grand_total':
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Grand Total',
                                      textAlign: TextAlign.start,
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
                              if (resp.isLoading == true) {
                                return null;
                              } else {
                                if (rowIndex != -1) {
                                  switch (column.mappingName) {
                                    case 'date':
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
                                          DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.parse(ModelReportPurchase.getDataPaid[rowIndex]['date'])),
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
                                          ModelReportPurchase.getDataPaid[rowIndex]['id'].toString(),
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'supplier':
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
                                          ModelReportPurchase.getDataPaid[rowIndex]['supplier'],
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'invoice_number':
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
                                          ModelReportPurchase.getDataPaid[rowIndex]['invoice_number'].toString(),
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'status':
                                      return Container(
                                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
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
                                        child: Container(
                                          padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                                          child: Text(
                                            ModelReportPurchase.getDataPaid[rowIndex]['status'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 10,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color:  ModelReportPurchase.getDataPaid[rowIndex]['status_id'] == 'credit' ? ColorTheme.danger :  ModelReportPurchase.getDataPaid[rowIndex]['status_id'] == 'cod' ? ColorTheme.warningColor :  ModelReportPurchase.getDataPaid[rowIndex]['status_id'] == 'consignment' ? Colors.blue : ColorTheme.successColor,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        )
                                      );
                                      break;
                                    case 'status_id':
                                      return Container(
                                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
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
                                        child: Container(
                                          padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                                          child: Text(
                                            ModelReportPurchase.getDataPaid[rowIndex]['status_title'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 10,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color:  ModelReportPurchase.getDataPaid[rowIndex]['status'] == 'credit' ? ColorTheme.danger :  ModelReportPurchase.getDataPaid[rowIndex]['status'] == 'cod' ? ColorTheme.warningColor :  ModelReportPurchase.getDataPaid[rowIndex]['status'] == 'consignment' ? Colors.blue : ColorTheme.successColor,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        )
                                      );
                                      break;
                                    case 'cashier':
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
                                          TextTransform.title(ModelReportPurchase.getDataPaid[rowIndex]['cashier']),
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'total':
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
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataPaid[rowIndex]['total'].toString())))
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'discount':
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
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataPaid[rowIndex]['discount'].toString())))
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
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataPaid[rowIndex]['subtotal'].toString())))
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'ppn':
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
                                        child: Container(
                                          child: Container(
                                            width: 18,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              color: double.parse(ModelReportPurchase.getDataPaid[rowIndex]['ppn']) > 0 ? ColorTheme.successColor :ColorTheme.danger,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              double.parse(ModelReportPurchase.getDataPaid[rowIndex]['ppn']) > 0 ? Mdi.check : Mdi.close,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                          ),
                                        ),
                                      );
                                      break;
                                    case 'grand_total':
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
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataPaid[rowIndex]['grand_total'].toString())))
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
                                mappingName: 'date', 
                                headerText: 'Tanggal',
                                width: 120,
                              ),
                              GridWidgetColumn(
                                mappingName: 'id', 
                                headerText: 'No. Transaksi',
                                width: 152,
                              ),
                              GridWidgetColumn(
                                mappingName: 'supplier', 
                                headerText: 'Supplier',
                                width: 320,
                              ),
                              GridWidgetColumn(
                                mappingName: 'invoice_number', 
                                headerText: 'No. Faktur',
                                width: 96,
                              ),
                              GridWidgetColumn(
                                mappingName: 'status', 
                                headerText: 'status',
                                width: 120,
                              ),
                              GridWidgetColumn(
                                mappingName: 'cashier', 
                                headerText: 'Kasir',
                                width: 104,
                              ),
                              GridWidgetColumn(
                                mappingName: 'total', 
                                headerText: 'Total',
                                width: 144,
                              ),
                              GridWidgetColumn(
                                mappingName: 'discount', 
                                headerText: 'Diskon',
                                width: 144,
                              ),
                              GridWidgetColumn(
                                mappingName: 'subtotal', 
                                headerText: 'Subtotal',
                                width: 144,
                              ),
                              GridWidgetColumn(
                                mappingName: 'ppn', 
                                headerText: 'PPN',
                                width: 72,
                              ),
                              GridWidgetColumn(
                                mappingName: 'grand_total', 
                                headerText: 'Grand Total',
                                width: 144,
                              ),
                            ],
                            onCellTap: (details) {
                              if (details.rowColumnIndex.rowIndex > 0) {
                                Get.to(ReportPurchaseRecapDetailScreen(ModelReportPurchase.getDataPaid[details.rowColumnIndex.rowIndex - 1]), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                _reportPurchaseController.readDetailRecap(ModelReportPurchase.getDataPaid[details.rowColumnIndex.rowIndex - 1]['id']);
                              }
                            },
                            // loadMoreViewBuilder: (BuildContext context, LoadMoreRows loadMoreRows) {
                            //   if(resp.isLoading == false) {
                            //     Future<String> loadRows() async {
                            //       // ignore: await_only_futures
                            //       await _reportPurchaseController.readMore();
                            //       return Future<String>.value('Completed');
                            //     }
                            //     return FutureBuilder<String>(
                            //       initialData: 'loading',
                            //       future: loadRows(),
                            //       builder: (context, snapShot) {
                            //         if (snapShot.data == 'loading') {
                            //           return Container(
                            //             height: 48.0,
                            //             color: Colors.white,
                            //             width: double.infinity,
                            //             alignment: Alignment.center,
                            //             child: Container(
                            //               width: 24,
                            //               height: 24,
                            //               child: CircularProgressIndicator(
                            //                 strokeWidth: 3,
                            //                 valueColor: AlwaysStoppedAnimation(ColorTheme.primary)
                            //               ),
                            //             )
                            //           );
                            //         } else {
                            //           return SizedBox.fromSize(size: Size.zero);
                            //         }
                            //       },
                            //     );
                            //   }
                            //   return null;
                            // },
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
    );
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }
}
