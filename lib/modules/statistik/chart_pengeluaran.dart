// card Quickcount
import 'package:ayopemilu_mobile/modules/statistik/statistik_controller.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Container chartPengeluaran(context, controller) {
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
                      color: Colors.grey.withValues(alpha: (0.5 * 255).toDouble()),
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text("Jumlah Pengeluaran"),
                    const SizedBox(height: 5),
                    controller.financeLoading
                        ? SkeletonLine(
                            style: SkeletonLineStyle(
                                alignment: Alignment.center,
                                height: 10,
                                width: MediaQuery.of(context).size.width / 3,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        : Text(
                            controller.numberRibuan.format(controller.financeDashboard['bignumber']['count']),
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
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: ThemeColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: (0.5 * 255).toDouble()),
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text("Total Pengeluaran"),
                    const SizedBox(height: 5),
                    controller.financeLoading
                        ? SkeletonLine(
                            style: SkeletonLineStyle(
                                alignment: Alignment.center,
                                height: 10,
                                width: MediaQuery.of(context).size.width / 3,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        : Text(
                            'Rp. ${controller.numberRibuan.format(int.parse(controller.financeDashboard['bignumber']['nominal']))}',
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
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: ThemeColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: (0.5 * 255).toDouble()),
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
                title: ChartTitle(text: 'Tren Jumlah Pengeluaran'),
                legend: Legend(isVisible: false),
                series: <LineSeries<FinanceMonth, String>>[
                  LineSeries<FinanceMonth, String>(
                      dataSource: controller.dataFinanceMonth,
                      xValueMapper: (FinanceMonth val, _) => val.monthText,
                      yValueMapper: (FinanceMonth val, _) => val.value,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      color: ThemeColor.red)
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
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
                      color: Colors.grey.withValues(alpha: (0.5 * 255).toDouble()),
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text("Jumlah Inventaris"),
                    const SizedBox(height: 5),
                    controller.inventoryLoading
                        ? SkeletonLine(
                            style: SkeletonLineStyle(
                                alignment: Alignment.center,
                                height: 10,
                                width: MediaQuery.of(context).size.width / 3,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        : Text(
                            controller.numberRibuan.format(controller.inventoryDashboard['bignumber']['count']),
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
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: ThemeColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: (0.5 * 255).toDouble()),
                      blurRadius: 3,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text("Nilai Inventaris"),
                    const SizedBox(height: 5),
                    controller.inventoryLoading
                        ? SkeletonLine(
                            style: SkeletonLineStyle(
                                alignment: Alignment.center,
                                height: 10,
                                width: MediaQuery.of(context).size.width / 3,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        : Text(
                            'Rp. ${controller.numberRibuan.format(int.parse(controller.inventoryDashboard['bignumber']['price']))}',
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
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: ThemeColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: (0.5 * 255).toDouble()),
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
                title: ChartTitle(text: 'Tren Nilai Inventaris'),
                legend: Legend(isVisible: false),
                series: <LineSeries<InventoryMonth, String>>[
                  LineSeries<InventoryMonth, String>(
                      dataSource: controller.dataInventoryMonth,
                      xValueMapper: (InventoryMonth val, _) => val.monthText,
                      yValueMapper: (InventoryMonth val, _) => val.value,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      color: ThemeColor.yellow)
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
