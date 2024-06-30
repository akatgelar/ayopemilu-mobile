import 'package:ayopemilu_mobile/modules/shared/skeleton.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletons/skeletons.dart';

Container sectionCaleg(context, controller) {
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
    child: Row(
      children: [
        ClipOval(
          child: SizedBox.fromSize(
              size: const Size.fromRadius(48),
              child: controller.loadingCaleg
                  ? const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        shape: BoxShape.circle,
                        width: 50,
                        height: 50,
                      ),
                    )
                  : Image.network(
                      "$apiBaseUrl/uploads/thumb/${controller.caleg.picture}",
                      height: 70,
                    )),
        ),
        const SizedBox(width: 10),
        controller.loadingCaleg
            ? skeletonParagraphCustom(context)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.caleg.name,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text("Calon Anggota ${controller.caleg.electionCategory}"),
                  Text(controller.caleg.electionArea),
                  Text("Daerah Pemilihan ${controller.caleg.electionSubarea}"),
                ],
              )
      ],
    ),
  );
}
