import 'package:flutter/widgets.dart';

Column sectionWelcome(context, controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Selamat datang,"),
      Text(
        '${controller.session.name} (Role ${controller.session.roleName})',
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ],
  );
}
