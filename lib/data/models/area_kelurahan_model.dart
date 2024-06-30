class AreaKelurahanModel {
  int id;
  String kemendagriProvinsiKode;
  String kemendagriProvinsiNama;
  String kemendagriKotaKode;
  String kemendagriKotaNama;
  String kemendagriKecamatanKode;
  String kemendagriKecamatanNama;
  String kemendagriKelurahanKode;
  String kemendagriKelurahanNama;

  AreaKelurahanModel({
    required this.id,
    required this.kemendagriProvinsiKode,
    required this.kemendagriProvinsiNama,
    required this.kemendagriKotaKode,
    required this.kemendagriKotaNama,
    required this.kemendagriKecamatanKode,
    required this.kemendagriKecamatanNama,
    required this.kemendagriKelurahanKode,
    required this.kemendagriKelurahanNama,
  });

  factory AreaKelurahanModel.fromMap(Map<String, dynamic> object) => AreaKelurahanModel(
        id: object['id'] ?? 0,
        kemendagriProvinsiKode: object['kemendagri_provinsi_kode'] ?? '',
        kemendagriProvinsiNama: object['kemendagri_provinsi_nama'] ?? '',
        kemendagriKotaKode: object['kemendagri_kota_kode'] ?? '',
        kemendagriKotaNama: object['kemendagri_kota_nama'] ?? '',
        kemendagriKecamatanKode: object['kemendagri_kecamatan_kode'] ?? '',
        kemendagriKecamatanNama: object['kemendagri_kecamatan_nama'] ?? '',
        kemendagriKelurahanKode: object['kemendagri_kelurahan_kode'] ?? '',
        kemendagriKelurahanNama: object['kemendagri_kelurahan_nama'] ?? '',
      );
}
