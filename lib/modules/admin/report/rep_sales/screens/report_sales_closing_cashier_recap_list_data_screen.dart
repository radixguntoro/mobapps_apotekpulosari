import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesClosingCashierRecapListDataScreen extends DataGridSource {
  final data;

  ReportSalesClosingCashierRecapListDataScreen(
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
      case 'title':
        return data['title'];
        break;
      case 'cashier_name':
        return TextTransform.title(data['cashier_name']);
        break;
      case 'total':
        return data['total'];
        break;
      case 'discount':
        return data['discount'];
        break;
      case 'grand_total':
        return data['grand_total'];
        break;
      default:
        return '';
        break;
    }
  }
}