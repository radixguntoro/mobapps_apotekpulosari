import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportPurchaseSupplierListDataScreen extends DataGridSource {
  final data;

  ReportPurchaseSupplierListDataScreen(
    this.data,
  );

  @override
  List<dynamic> get dataSource => data;

  @override
  Object getValue(dynamic data, String columnName) {
    switch (columnName) {
      case 'id':
        return data['id'];
        break;
      case 'name':
        return data['name'];
        break;
      case 'total_invoice':
        return int.parse(data['total_invoice'].toString());
        break;
      case 'total_purchase':
        return double.parse(data['total_purchase'].toString());
        break;
      default:
        return '';
        break;
    }
  }
}