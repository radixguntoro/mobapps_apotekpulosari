import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportPurchaseSupplierRecapListDataScreen extends DataGridSource {
  final data;

  ReportPurchaseSupplierRecapListDataScreen(
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
      case 'status_id':
        return data['status_id'];
        break;
      case 'status':
        return data['status'];
        break;
      case 'supplier_name':
        return data['supplier_name'];
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