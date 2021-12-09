import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesCustomerListDataScreen extends DataGridSource {
  final data;

  ReportSalesCustomerListDataScreen(
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
      case 'total_sales':
        return double.parse(data['total_sales'].toString());
        break;
      default:
        return '';
        break;
    }
  }
}