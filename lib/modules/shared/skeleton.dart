import 'package:flutter/widgets.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

Column skeletonParagraphCustom(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SkeletonLine(
        style: SkeletonLineStyle(height: 10, width: MediaQuery.of(context).size.width / 3, borderRadius: BorderRadius.circular(8)),
      ),
      const SizedBox(height: 5),
      SkeletonLine(
        style: SkeletonLineStyle(height: 10, width: MediaQuery.of(context).size.width / 2, borderRadius: BorderRadius.circular(8)),
      ),
      const SizedBox(height: 5),
      SkeletonLine(
        style: SkeletonLineStyle(height: 10, width: MediaQuery.of(context).size.width / 2, borderRadius: BorderRadius.circular(8)),
      ),
      const SizedBox(height: 5),
      SkeletonLine(
        style: SkeletonLineStyle(height: 10, width: MediaQuery.of(context).size.width / 2, borderRadius: BorderRadius.circular(8)),
      )
    ],
  );
}
