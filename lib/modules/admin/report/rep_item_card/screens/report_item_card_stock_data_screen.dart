import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportItemCardStockDataScreen extends DataGridSource {
  final data;

  ReportItemCardStockDataScreen(
    this.data,
  );

  @override
  List<dynamic> get dataSource => data;

  @override
  Object getValue(dynamic data, String columnName) {
    switch (columnName) {
      case 'number':
        return data['number'];
        break;
      case 'id':
        return data['id'];
        break;
      case 'name':
        return data['name'];
        break;
      case 'category':
        return data['category'];
        break;
      case 'unit':
        return data['unit'];
        break;
      case 'status':
        return data['status'];
        break;
      case 'stock':
        return data['stock'];
        break;
      case 'price':
        return double.parse(data['price']);
        break;
      case 'subtotal':
        return double.parse(data['subtotal'].toString());
        break;
      default:
        return '';
        break;
    }
  }
}