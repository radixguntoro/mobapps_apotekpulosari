import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesNettoListDataScreen extends DataGridSource {
  final data;

  ReportSalesNettoListDataScreen(
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
      case 'status':
        return data['status'];
        break;
      case 'status_id':
        return data['status_id'];
        break;
      case 'title':
        return TextTransform.title(data['title']);
        break;
      case 'cashier_name':
        return TextTransform.title(data['cashier_name']);
        break;
      case 'customer_name':
        return data['customer_name'];
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