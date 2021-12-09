import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesClosingCashierListDataScreen extends DataGridSource {
  final data;

  ReportSalesClosingCashierListDataScreen(
    this.data,
  );

  @override
  List<dynamic> get dataSource => data;

  @override
  Object getValue(dynamic data, String columnName) {
    switch (columnName) {
      case 'created_at':
        return data['created_at'];
        break;
      case 'id':
        return data['id'].toString();
        break;
      case 'shift':
        return data['shift'];
        break;
      case 'time_at':
        return data['time_at'];
        break;
      case 'cashier':
        return data['cashier'];
        break;
      case 'income_app':
        return data['income_app'];
        break;
      case 'income_real':
        return data['income_real'];
        break;
      case 'income_diff':
        return data['income_diff'];
        break;
      default:
        return '';
        break;
    }
  }
}