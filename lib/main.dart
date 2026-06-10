import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(useMaterial3: false),
      home: MyHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.
class MyHomePage extends StatefulWidget {
  /// Creates the home page.
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static const int columnCount =
      20; // More Columns to demonstrate horizontal scrolling
  static const int rowCount = 20; // More Rows to demonstrate vertical scrolling
  List<RowItem> rows = <RowItem>[]; // list of data rows
  late RowDataSource dataSource;

  @override
  void initState() {
    super.initState();
    rows = getRowData();
    dataSource = RowDataSource(items: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter DataGrid')),
      body: Center(
        child: SizedBox(
          width: 800,
          height: 800,
          child: SfDataGrid(
            source: dataSource,
            columnWidthMode:
                ColumnWidthMode.auto, // auto size columns to fit content
            columns: List<GridColumn>.generate(columnCount, (index) {
              // generate 20 columns
              final name = 'c$index';
              return GridColumn(
                columnName: name,
                label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('C${index + 1}'),
                ),
              );
            }),
            footer: SizedBox(), // Empty footer to demonstrate
            footerHeight: 20.0, // Custom footer height as required.
          ),
        ),
      ),
    );
  }

  // Generate 20x20 data rows
  List<RowItem> getRowData() {
    final result = <RowItem>[];
    for (int r = 1; r <= rowCount; r++) {
      final values = List<dynamic>.generate(
        columnCount,
        (c) => 'R$r-C${c + 1}',
      );
      result.add(RowItem(values));
    }
    return result;
  }
}

/// Simple row model that holds 20 column values
class RowItem {
  RowItem(this.values);
  final List<dynamic> values; // length = columnCount
}

/// Data source that maps RowItem values into 20 DataGridCells
class RowDataSource extends DataGridSource {
  RowDataSource({required List<RowItem> items}) {
    _rows = items
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: List<DataGridCell<dynamic>>.generate(
              e.values.length,
              (index) => DataGridCell<dynamic>(
                columnName: 'c$index',
                value: e.values[index],
              ),
            ),
          ),
        )
        .toList();
  }

  List<DataGridRow> _rows = [];

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
