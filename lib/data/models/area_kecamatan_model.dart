class AreaKecamatanModel {
  int id;
  String kemendagriProvinsiKode;
  String kemendagriProvinsiNama;
  String kemendagriKotaKode;
  String kemendagriKotaNama;
  String kemendagriKecamatanKode;
  String kemendagriKecamatanNama;

  AreaKecamatanModel({
    required this.id,
    required this.kemendagriProvinsiKode,
    required this.kemendagriProvinsiNama,
    required this.kemendagriKotaKode,
    required this.kemendagriKotaNama,
    required this.kemendagriKecamatanKode,
    required this.kemendagriKecamatanNama,
  });

  factory AreaKecamatanModel.fromMap(Map<String, dynamic> object) => AreaKecamatanModel(
        id: object['id'] ?? 0,
        kemendagriProvinsiKode: object['kemendagri_provinsi_kode'] ?? '',
        kemendagriProvinsiNama: object['kemendagri_provinsi_nama'] ?? '',
        kemendagriKotaKode: object['kemendagri_kota_kode'] ?? '',
        kemendagriKotaNama: object['kemendagri_kota_nama'] ?? '',
        kemendagriKecamatanKode: object['kemendagri_kecamatan_kode'] ?? '',
        kemendagriKecamatanNama: object['kemendagri_kecamatan_nama'] ?? '',
      );
}
