// card Quickcount
import 'package:ayopemilu_mobile/modules/statistik/statistik_controller.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Container chartPemilih(context, controller) {
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
                    const Text("Calon Pemilih"),
                    const SizedBox(height: 5),
                    controller.votersLoading
                        ? SkeletonLine(
                            style: SkeletonLineStyle(
                                alignment: Alignment.center,
                                height: 10,
                                width: MediaQuery.of(context).size.width / 3,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        : Text(
                            controller.numberRibuan.format(controller.votersDashboard['bignumber']['voters']),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
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
                    const Text("Target Pemilih"),
                    const SizedBox(height: 5),
                    controller.votersLoading
                        ? SkeletonLine(
                            style: SkeletonLineStyle(
                                alignment: Alignment.center,
                                height: 10,
                                width: MediaQuery.of(context).size.width / 3,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        : Text(
                            controller.numberRibuan.format(controller.votersDashboard['bignumber']['voters_target']),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
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
                    const Text("Jumlah DPT"),
                    const SizedBox(height: 5),
                    controller.votersLoading
                        ? SkeletonLine(
                            style: SkeletonLineStyle(
                                alignment: Alignment.center,
                                height: 10,
                                width: MediaQuery.of(context).size.width / 3,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        : Text(
                            controller.numberRibuan.format(controller.votersDashboard['bignumber']['voters_all']),
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
        // container peluang
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
              const Text(
                "Peluang menang",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              controller.votersLoading
                  ? SkeletonLine(
                      style: SkeletonLineStyle(
                          alignment: Alignment.center,
                          height: 10,
                          width: MediaQuery.of(context).size.width / 2,
                          borderRadius: BorderRadius.circular(8)),
                    )
                  : Text(
                      "(${controller.numberRibuan.format(controller.votersDashboard['bignumber']['voters'])} calon pemilih / ${controller.numberRibuan.format(controller.votersDashboard['bignumber']['voters_target'])} target pemilih)"),
              const SizedBox(height: 10),
              controller.votersLoading
                  ? SkeletonLine(
                      style: SkeletonLineStyle(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1,
                          borderRadius: BorderRadius.circular(8)),
                    )
                  : LinearPercentIndicator(
                      lineHeight: 30.0,
                      percent: controller.votersDashboard['bignumber']['percentage'] / 100,
                      backgroundColor: ThemeColor.greyMedium,
                      progressColor: ThemeColor.primary,
                      animation: true,
                      barRadius: const Radius.circular(15),
                      center: Text(
                        "${(controller.votersDashboard['bignumber']['percentage']).toStringAsFixed(2)}%",
                        style: controller.votersDashboard['bignumber']['percentage'] < 40
                            ? const TextStyle(fontSize: 12, color: ThemeColor.black)
                            : const TextStyle(fontSize: 12, color: ThemeColor.white),
                      ),
                    ),
              const SizedBox(height: 5)
            ],
          ),
        ),

        // container gender
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
              SfCircularChart(
                title: ChartTitle(text: 'Demografi Calon Pemilih'),
                backgroundColor: Colors.white,
                onDataLabelRender: (DataLabelRenderArgs args) {
                  double value = double.parse(args.text.toString());
                  args.text = value.toStringAsFixed(0);
                },
                series: <CircularSeries<VotersGender, String>>[
                  DoughnutSeries<VotersGender, String>(
                    selectionBehavior: SelectionBehavior(enable: true),
                    explode: true,
                    dataSource: controller.dataVotersGender,
                    xValueMapper: (VotersGender val, _) => val.name,
                    yValueMapper: (VotersGender val, _) => val.number,
                    pointColorMapper: (VotersGender val, _) => val.color,
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

        // container religion
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
              SfCircularChart(
                title: ChartTitle(text: 'Agama Calon Pemilih'),
                backgroundColor: Colors.white,
                onDataLabelRender: (DataLabelRenderArgs args) {
                  double value = double.parse(args.text.toString());
                  args.text = value.toStringAsFixed(0);
                },
                series: <CircularSeries<VotersReligion, String>>[
                  DoughnutSeries<VotersReligion, String>(
                    selectionBehavior: SelectionBehavior(enable: true),
                    explode: true,
                    dataSource: controller.dataVotersReligion,
                    xValueMapper: (VotersReligion val, _) => val.name,
                    yValueMapper: (VotersReligion val, _) => val.number,
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

        // container month
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
                title: ChartTitle(text: 'Tren Jumlah Calon Pemilih'),
                legend: Legend(isVisible: false),
                series: <ColumnSeries<VotersMonth, String>>[
                  ColumnSeries<VotersMonth, String>(
                      dataSource: controller.dataVotersMonth,
                      xValueMapper: (VotersMonth val, _) => val.monthText,
                      yValueMapper: (VotersMonth val, _) => val.value,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      color: ThemeColor.primary)
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
