import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesCustomerRecapListDataScreen extends DataGridSource {
  final data;

  ReportSalesCustomerRecapListDataScreen(
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
      case 'codes_id':
        return data['codes_id'];
        break;
      case 'id':
        return data['id'];
        break;
      case 'status':
        return data['status'];
        break;
      case 'status_title':
        return data['status_title'];
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