class AreaProvinsiModel {
  int id;
  String kemendagriProvinsiKode;
  String kemendagriProvinsiNama;

  AreaProvinsiModel({
    required this.id,
    required this.kemendagriProvinsiKode,
    required this.kemendagriProvinsiNama,
  });

  factory AreaProvinsiModel.fromMap(Map<String, dynamic> object) => AreaProvinsiModel(
        id: object['id'] ?? 0,
        kemendagriProvinsiKode: object['kemendagri_provinsi_kode'] ?? '',
        kemendagriProvinsiNama: object['kemendagri_provinsi_nama'] ?? '',
      );
}
