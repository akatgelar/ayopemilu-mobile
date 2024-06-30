import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih_add/pemilih_add_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class PemilihAddPage extends StatefulWidget {
  const PemilihAddPage({super.key});

  @override
  State<PemilihAddPage> createState() => _PemilihAddPageState();
}

class _PemilihAddPageState extends State<PemilihAddPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PemilihAddController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.pemilihId == '0' ? headerMenu(true, false, "Tambah Calon Pemilih") : headerMenu(true, false, "Edit Calon Pemilih"),
                controller.loadingPemilih
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Lengkap",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Budi Sudarsono"),
                                  controller: controller.nameCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jenis Kelamin",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonFormField(
                                  value: controller.genderCtrl.text.isEmpty ? null : controller.genderCtrl.text,
                                  decoration: styleFormInput("contoh: Laki-laki"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: <String>['Laki-laki', 'Perempuan'].map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    controller.genderCtrl.text = value.toString();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tanggal Lahir",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                    controller: controller.bodCtrl,
                                    decoration: styleFormInput("contoh: 1990-12-31"),
                                    keyboardType: TextInputType.datetime,
                                    onTap: () async {
                                      controller.pickDate(context);
                                    }),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Agama",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonFormField(
                                  value: controller.religionCtrl.text.isEmpty ? null : controller.religionCtrl.text,
                                  decoration: styleFormInput("contoh: Islam"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: <String>['Islam', 'Kristen Katolik', 'Kristen Protestan', 'Hindu', 'Budha', 'Konghuchu']
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    controller.religionCtrl.text = value.toString();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "No KTP",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: 3273xxxxxxxxxxxx"),
                                  keyboardType: TextInputType.number,
                                  controller: controller.nikCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "No Handphone",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: 081xxxxxx"),
                                  keyboardType: TextInputType.phone,
                                  controller: controller.phoneCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Provinsi",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonFormField(
                                  value: controller.provinsiKodeCtrl.text.isEmpty ? null : controller.provinsiKodeCtrl.text,
                                  decoration: styleFormInput("contoh: Jawa Barat"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: controller.provinsiData.map(
                                    (res) {
                                      return DropdownMenuItem(
                                        value: res.kemendagriProvinsiKode,
                                        child: Text(
                                          res.kemendagriProvinsiNama,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    controller.provinsiKodeCtrl.text = value!;
                                    controller.getKota(controller.provinsiKodeCtrl.text);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kota / Kabupaten",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonFormField(
                                  value: controller.kotaKodeCtrl.text.isEmpty ? null : controller.kotaKodeCtrl.text,
                                  decoration: styleFormInput("contoh: Kab Bandung"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: controller.kotaData.map(
                                    (res) {
                                      return DropdownMenuItem(
                                        value: res.kemendagriKotaKode,
                                        child: Text(
                                          res.kemendagriKotaNama,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    controller.kotaKodeCtrl.text = value!;
                                    controller.getKecamatan(controller.kotaKodeCtrl.text);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kecamatan",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonFormField(
                                  value: controller.kecamatanKodeCtrl.text.isEmpty ? null : controller.kecamatanKodeCtrl.text,
                                  decoration: styleFormInput("contoh: Rancaekek"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: controller.kecamatanData.map(
                                    (res) {
                                      return DropdownMenuItem(
                                        value: res.kemendagriKecamatanKode,
                                        child: Text(
                                          res.kemendagriKecamatanNama,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    controller.kecamatanKodeCtrl.text = value!;
                                    controller.getKelurahan(controller.kecamatanKodeCtrl.text);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kelurahan / Desa",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonFormField(
                                  value: controller.kelurahanKodeCtrl.text.isEmpty ? null : controller.kelurahanKodeCtrl.text,
                                  decoration: styleFormInput("contoh: Bojongloa"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: controller.kelurahanData.map(
                                    (res) {
                                      return DropdownMenuItem(
                                        value: res.kemendagriKelurahanKode,
                                        child: Text(
                                          res.kemendagriKelurahanNama,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    controller.kelurahanKodeCtrl.text = value!;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Alamat Lengkap",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Jalan xxx No xx"),
                                  minLines: 4,
                                  maxLines: null,
                                  controller: controller.addressCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Foto ",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () async {
                                    controller.pickFiles();
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: ThemeColor.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text("Upload Foto"),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: controller.pemilihId == '0'
                                      // add
                                      ? SizedBox(
                                          height: 200.00,
                                          width: 200.00,
                                          child: controller.paths != null
                                              ? Image.memory(controller.paths!.first.bytes!)
                                              : Image.asset('assets/images/thumbnail.png'),
                                        )
                                      // edit
                                      : SizedBox(
                                          height: 200.00,
                                          width: 200.00,
                                          child: controller.paths != null
                                              ? Image.memory(controller.paths!.first.bytes!)
                                              : Image.network("$apiBaseUrl/uploads/thumb/${controller.pemilihData.picture}"),
                                        ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Catatan",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Pemilih loyal"),
                                  minLines: 3,
                                  maxLines: null,
                                  controller: controller.notesCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              style: styleFormButtonGreen(context, 50),
                              onPressed: () {
                                if (controller.pemilihId == '0') {
                                  controller.actionInsert();
                                } else {
                                  controller.actionUpdate();
                                }
                              },
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CupertinoIcons.floppy_disk),
                                  SizedBox(width: 5),
                                  Text(
                                    "Simpan",
                                    style: TextStyle(
                                      color: ThemeColor.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
