import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/widgets.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

Container sectionContdown(context, controller) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: ThemeColor.grey,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: ThemeColor.greylight,
    ),
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        const Text(
          "Hitung mundur pemilu",
          style: TextStyle(color: ThemeColor.primary),
        ),
        const SizedBox(height: 10),
        controller.loadingCountdown
            ? SkeletonLine(
                style: SkeletonLineStyle(
                  alignment: Alignment.center,
                  height: 10,
                  width: MediaQuery.of(context).size.width / 2,
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            : Text(
                countDown(),
                style: const TextStyle(color: ThemeColor.primary, fontSize: 20),
              ),
      ],
    ),
  );
}
