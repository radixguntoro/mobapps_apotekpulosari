import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportPurchasePaidListDataScreen extends DataGridSource {
  final data;

  ReportPurchasePaidListDataScreen(
    this.data,
  );

  @override
  List<dynamic> get dataSource => data;

  @override
  Object getValue(dynamic data, String columnName) {
    switch (columnName) {
      case 'date':
        return DateFormat('dd-MM-yyyy HH:mm').format(DateTime.parse(data['date']));
        break;
      case 'id':
        return data['id'];
        break;
      case 'invoice_number':
        return data['invoice_number'];
        break;
      case 'status_id':
        return data['status_id'];
        break;
      case 'status':
        return data['status'];
        break;
      case 'cashier':
        return data['cashier'];
        break;
      case 'supplier':
        return data['supplier'];
        break;
      case 'total':
        return data['total'];
        break;
      case 'discount':
        return data['discount'];
        break;
      case 'ppn':
        return data['ppn'];
        break;
      case 'subtotal':
        return data['subtotal'];
        break;
      case 'grand_total':
        return data['grand_total'];
        break;
      case 'total_return':
        return data['total_return'];
        break;
      default:
        return '';
        break;
    }
  }
}
// import 'package:apotik_pulosari/components/transition/model_transition.dart';
// import 'package:apotik_pulosari/components/utilities/color.dart';
// import 'package:apotik_pulosari/components/utilities/text_transform.dart';
// import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
// import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_custom_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:mdi/mdi.dart';

// class ReportPurchaseRecapListDataScreen extends StatelessWidget {
//   final ReportPurchaseController _reportPurchaseController = Get.put(ReportPurchaseController());
//   final data;
//   final index;

//   ReportPurchaseRecapListDataScreen(
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
//                         data['invoice_number'].toString(),
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
//                               Mdi.calendar,
//                               size: 14,
//                               color: Colors.black38,
//                             ),
//                           ),
//                           Container(
//                             child: Text(
//                               DateFormat("dd-MM-yyyy").format(DateTime.parse(data['date'].toString())),
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.black38,
//                               ),
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
//                         data['supplier'] != null ? data['supplier'].toUpperCase() : "-",
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w600
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             child: Row(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(right: 8),
//                                   padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
//                                   child: Text(
//                                     data['status'],
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontStyle: FontStyle.italic,
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: data['status_id'] == 'credit' ? ColorTheme.danger : data['status_id'] == 'cod' ? ColorTheme.warningColor : data['status_id'] == 'consignment' ? Colors.blue : ColorTheme.successColor,
//                                     borderRadius: BorderRadius.circular(6),
//                                   ),
//                                 ),
//                                 Container(
//                                   child: Row(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(right: 4),
//                                         child: Icon(
//                                           Mdi.account,
//                                           size: 14,
//                                           color: Colors.black38,
//                                         ),
//                                       ),
//                                       Text(
//                                         TextTransform.title(data['cashier']),
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           color: Colors.black38
//                                         ),
//                                       ),
//                                     ],
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
//         Get.to(ReportPurchaseRecapDetailScreen(data), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
//         _reportPurchaseController.readDetail(data['id'], data['codes_id']);
//       },
//     );
//   }
// }