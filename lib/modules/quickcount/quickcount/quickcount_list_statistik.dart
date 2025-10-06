// card Quickcount
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _HasilData {
  _HasilData(this.year, this.sales, this.color);

  final String year;
  final double sales;
  final Color color;
}

Container quickcountListStatistik(context) {
  List<_HasilData> chartData = [
    _HasilData('Calon 1', 95, Colors.redAccent),
    _HasilData('Calon 2', 28, Colors.blueAccent),
    _HasilData('Calon 3', 34, Colors.orangeAccent),
  ];
  return Container(
    color: ThemeColor.white,
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SfCircularChart(
          backgroundColor: Colors.white,
          onDataLabelRender: (DataLabelRenderArgs args) {
            double value = double.parse(args.text.toString());
            args.text = value.toStringAsFixed(0);
          },
          series: <CircularSeries<_HasilData, String>>[
            PieSeries<_HasilData, String>(
              selectionBehavior: SelectionBehavior(enable: true),
              explode: true,
              dataSource: chartData,
              xValueMapper: (_HasilData hasil, _) => hasil.year,
              yValueMapper: (_HasilData hasil, _) => hasil.sales,
              pointColorMapper: (_HasilData hasil, _) => hasil.color,
              name: 'Hasil',
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
              ),
            )
          ],
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
        ),
      ],
    ),
  );
}
