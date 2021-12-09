import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesItemListDataScreen extends DataGridSource {
  final data;

  ReportSalesItemListDataScreen(
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
      case 'qty_regular':
        return data['qty_regular'];
        break;
      case 'qty_mix':
        return data['qty_mix'];
        break;
      case 'qty_recipe':
        return data['qty_recipe'];
        break;
      case 'qty_lab':
        return data['qty_lab'];
        break;
      case 'qty_netto':
        return data['qty_netto'];
        break;
      case 'qty_credit':
        return data['qty_credit'];
        break;
      case 'total_qty':
        return data['total_qty'];
        break;
      case 'sales_regular':
        return data['sales_regular'];
        break;
      case 'sales_mix':
        return data['sales_mix'];
        break;
      case 'sales_recipe':
        return data['sales_recipe'];
        break;
      case 'sales_lab':
        return data['sales_lab'];
        break;
      case 'sales_netto':
        return data['sales_netto'];
        break;
      case 'sales_credit':
        return data['sales_credit'];
        break;
      case 'total_sales':
        return data['total_sales'];
        break;
      default:
        return '';
        break;
    }
  }
}