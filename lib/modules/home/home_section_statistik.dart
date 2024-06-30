import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

Column sectionStatistik(context, controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Statistik",
        style: TextStyle(
          color: ThemeColor.primary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 10),
      // container jumlah
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: ThemeColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text("Jumlah Relawan"),
                  const SizedBox(height: 5),
                  controller.loadingRelawan
                      ? SkeletonLine(
                          style: SkeletonLineStyle(
                              alignment: Alignment.center,
                              height: 10,
                              width: MediaQuery.of(context).size.width / 3,
                              borderRadius: BorderRadius.circular(8)),
                        )
                      : Text(
                          controller.numberRibuan.format(controller.countRelawan),
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
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text("Jumlah Pemilih"),
                  const SizedBox(height: 5),
                  controller.loadingPemilih
                      ? SkeletonLine(
                          style: SkeletonLineStyle(
                              alignment: Alignment.center,
                              height: 10,
                              width: MediaQuery.of(context).size.width / 3,
                              borderRadius: BorderRadius.circular(8)),
                        )
                      : Text(
                          controller.numberRibuan.format(controller.countPemilih),
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
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text("Jumlah Laporan"),
                  const SizedBox(height: 5),
                  controller.loadingLaporan
                      ? SkeletonLine(
                          style: SkeletonLineStyle(
                              alignment: Alignment.center,
                              height: 10,
                              width: MediaQuery.of(context).size.width / 3,
                              borderRadius: BorderRadius.circular(8)),
                        )
                      : Text(
                          controller.numberRibuan.format(controller.countLaporan),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
      const SizedBox(height: 10),
      // container peluang
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: ThemeColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
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
            controller.loadingPemilih
                ? SkeletonLine(
                    style: SkeletonLineStyle(
                        alignment: Alignment.center,
                        height: 10,
                        width: MediaQuery.of(context).size.width / 2,
                        borderRadius: BorderRadius.circular(8)),
                  )
                : Text(
                    "(${controller.numberRibuan.format(controller.countPemilih)} calon pemilih / ${controller.numberRibuan.format(controller.caleg.electionVotersTarget)} target pemilih)"),
            const SizedBox(height: 10),
            controller.loadingPemilih
                ? SkeletonLine(
                    style: SkeletonLineStyle(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1,
                        borderRadius: BorderRadius.circular(8)),
                  )
                : LinearPercentIndicator(
                    lineHeight: 30.0,
                    percent: controller.peluangMenang,
                    backgroundColor: ThemeColor.greyMedium,
                    progressColor: ThemeColor.primary,
                    animation: true,
                    barRadius: const Radius.circular(15),
                    center: Text(
                      "${controller.numberDesimal.format(controller.peluangMenang * 100)} %",
                      style: controller.peluangMenang < 0.4
                          ? const TextStyle(fontSize: 12, color: ThemeColor.black)
                          : const TextStyle(fontSize: 12, color: ThemeColor.white),
                    ),
                  ),
          ],
        ),
      ),
    ],
  );
}
