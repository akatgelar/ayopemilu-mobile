// card Quickcount
import 'package:ayopemilu_mobile/modules/statistik/statistik_controller.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:skeletons/skeletons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Container chartLaporan(context, controller) {
  return Container(
    color: ThemeColor.white,
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            const SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: ThemeColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text("Total Laporan Masuk"),
                    const SizedBox(height: 5),
                    controller.reportLoading
                        ? SkeletonLine(
                            style: SkeletonLineStyle(
                                alignment: Alignment.center,
                                height: 10,
                                width: MediaQuery.of(context).size.width / 3,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        : Text(
                            controller.numberRibuan.format(controller.reportDashboard['bignumber']['report']),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
        const SizedBox(height: 20),
        // container pie
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: ThemeColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 5),
              SfCircularChart(
                title: ChartTitle(text: 'Kategori Laporan'),
                backgroundColor: Colors.white,
                onDataLabelRender: (DataLabelRenderArgs args) {
                  double value = double.parse(args.text);
                  args.text = value.toStringAsFixed(0);
                },
                series: <CircularSeries<ReportStatus, String>>[
                  DoughnutSeries<ReportStatus, String>(
                    selectionBehavior: SelectionBehavior(enable: true),
                    explode: true,
                    dataSource: controller.dataReportStatus,
                    xValueMapper: (ReportStatus val, _) => val.name,
                    yValueMapper: (ReportStatus val, _) => val.number,
                    pointColorMapper: (ReportStatus val, _) => val.color,
                    name: 'Hasil',
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  )
                ],
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
              const SizedBox(height: 5)
            ],
          ),
        ),

        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: ThemeColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 5),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Tren Jumlah Laporan'),
                legend: Legend(isVisible: false),
                series: <ColumnSeries<ReportMonth, String>>[
                  ColumnSeries<ReportMonth, String>(
                      dataSource: controller.dataReportMonth,
                      xValueMapper: (ReportMonth val, _) => val.monthText,
                      yValueMapper: (ReportMonth val, _) => val.value,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      color: ThemeColor.green)
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
