# How-to-reposition-the-horizontal-scrollbar-using-footer-spacing-in-Flutter-SfDataGrid

In this article, we will show you how to reposition the horizontal scrollbar using footer spacing in [Flutter DataTable](https://www.syncfusion.com/flutter-widgets/flutter-datagrid).


Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) widget with all the required configurations. In the default implementation, the horizontal scrollbar is rendered above the last row, and its layout behavior is managed internally by the framework’s scrolling mechanism.

To adjust the visual placement of the scrollbar, you can use the [SfDataGrid.footer](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid/footer.html) property by adding a [SizedBox](https://api.flutter.dev/flutter/widgets/SizedBox-class.html) widget. By specifying its height through the [SfDataGrid.footerHeight](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid/footerHeight.html) property, additional layout space can be introduced below the grid. This effectively shifts the perceived position of the horizontal scrollbar without altering the underlying scroll behavior.

```dart
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
```

You can download this example in [GitHub](https://github.com/SyncfusionExamples/How-to-reposition-the-horizontal-scrollbar-using-footer-spacing-in-Flutter-SfDataGrid).