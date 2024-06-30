// divider Pemilih
import 'package:flutter/material.dart';

Column dividerList() {
  return const Column(children: [
    SizedBox(height: 10),
    Divider(
      color: Color.fromARGB(100, 0, 0, 0),
      thickness: 0.1,
    ),
    SizedBox(height: 10),
  ]);
}
