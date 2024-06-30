class AreaKotaModel {
  int id;
  String kemendagriProvinsiKode;
  String kemendagriProvinsiNama;
  String kemendagriKotaKode;
  String kemendagriKotaNama;

  AreaKotaModel({
    required this.id,
    required this.kemendagriProvinsiKode,
    required this.kemendagriProvinsiNama,
    required this.kemendagriKotaKode,
    required this.kemendagriKotaNama,
  });

  factory AreaKotaModel.fromMap(Map<String, dynamic> object) => AreaKotaModel(
        id: object['id'] ?? 0,
        kemendagriProvinsiKode: object['kemendagri_provinsi_kode'] ?? '',
        kemendagriProvinsiNama: object['kemendagri_provinsi_nama'] ?? '',
        kemendagriKotaKode: object['kemendagri_kota_kode'] ?? '',
        kemendagriKotaNama: object['kemendagri_kota_nama'] ?? '',
      );
}
