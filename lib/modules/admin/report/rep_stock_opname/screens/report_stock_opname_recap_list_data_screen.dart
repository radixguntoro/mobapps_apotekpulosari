import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportStockOpnameRecapListDataScreen extends DataGridSource {
  final data;

  ReportStockOpnameRecapListDataScreen(
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
      case 'category':
        return data['category'];
        break;
      case 'cashier_name':
        return data['cashier_name'];
        break;
      case 'stock_in_system':
        return data['stock_in_system'];
        break;
      case 'stock_in_physic':
        return data['stock_in_physic'];
        break;
      case 'stock_difference':
        return data['stock_difference'];
        break;
      case 'created_at':
        return data['created_at'];
        break;
      case 'status':
        return data['status'];
        break;
      case 'price_sell':
        return data['price_sell'];
        break;
      default:
        return '';
        break;
    }
  }
}