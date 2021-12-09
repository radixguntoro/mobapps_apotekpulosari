import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportItemCardStockOutDataScreen extends DataGridSource {
  final data;

  ReportItemCardStockOutDataScreen(
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
      case 'note_id':
        return data['note_id'];
        break;
      case 'note':
        return data['note'];
        break;
      case 'sku':
        return data['sku'];
        break;
      case 'name':
        return data['name'];
        break;
      case 'category':
        return data['category'];
        break;
      case 'qty':
        return data['qty'];
        break;
      case 'price':
        return double.parse(data['price']);
        break;
      case 'subtotal':
        return double.parse(data['subtotal'].toString());
        break;
      case 'created_at':
        return data['created_at'];
        break;
      case 'cashier_name':
        return data['cashier_name'];
        break;
      default:
        return '';
        break;
    }
  }
}