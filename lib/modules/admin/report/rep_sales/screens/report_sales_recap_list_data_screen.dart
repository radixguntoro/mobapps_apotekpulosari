import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesRecapListDataScreen extends DataGridSource {
  final data;

  ReportSalesRecapListDataScreen(
    this.data,
  );

  @override
  List<dynamic> get dataSource => data;

  @override
  Object getValue(dynamic data, String columnName) {
    switch (columnName) {
      case 'created_at':
        return DateFormat('dd-MM-yyyy HH:mm').format(DateTime.parse(data['created_at']));
        break;
      case 'id':
        return data['id'];
        break;
      case 'title':
        return TextTransform.title(data['title']);
        break;
      case 'cashier_name':
        return TextTransform.title(data['cashier_name']);
        break;
      case 'grand_total':
        return double.parse(data['grand_total'].toString());
        break;
      default:
        return '';
        break;
    }
  }
}
// import 'package:apotik_pulosari/components/transition/model_transition.dart';
// import 'package:apotik_pulosari/components/utilities/text_transform.dart';
// import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
// import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_custom_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:mdi/mdi.dart';

// class ReportSalesCustomListDataScreen extends StatelessWidget {
//   final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
//   final data;
//   final index;

//   ReportSalesCustomListDataScreen(
//     this.data,
//     this.index
//   );

//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       padding: EdgeInsets.all(0),
//       child: Container(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 4,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 6),
//                       child: Text(
//                         DateFormat("dd-MM-yyyy").format(DateTime.parse(data['created_at'].toString())),
//                         style: TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 4),
//                             child: Icon(
//                               Mdi.clockOutline,
//                               size: 14,
//                               color: Colors.black38,
//                             ),
//                           ),
//                           Text(
//                             DateFormat("HH:mm").format(DateTime.parse(data['created_at'].toString())),
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.black38
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: 6),
//                       child: Text(
//                         data['id'].toString(),
//                         style: TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 56,
//                             margin: EdgeInsets.only(right: 8),
//                             child: Text(
//                               data['title'].toString(),
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.black38
//                               ),
//                             ),
//                           ),
//                           Container(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(right: 4),
//                                   child: Icon(
//                                     Mdi.account,
//                                     size: 14,
//                                     color: Colors.black38,
//                                   ),
//                                 ),
//                                 Text(
//                                   TextTransform.title(data['cashier']),
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.black38
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                 child: Text(
//                   NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(data['grand_total']))),
//                   textAlign: TextAlign.end,
//                   style: TextStyle(
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       onPressed: () {
//         Get.to(ReportSalesCustomDetailScreen(data), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
//         _reportSalesController.readDetail(data['id'], data['codes_id']);
//       },
//     );
//   }
// }