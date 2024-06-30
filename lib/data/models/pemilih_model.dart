class PemilihModel {
  int id;
  String name;
  String gender;
  String bod;
  String religion;
  String nik;
  String provinsiKode;
  String provinsiNama;
  String kotaKode;
  String kotaNama;
  String kecamatanKode;
  String kecamatanNama;
  String kelurahanKode;
  String kelurahanNama;
  String phone;
  String address;
  String picture;
  String notes;
  int createdBy;
  String createdName;
  String createdAt;

  PemilihModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.bod,
    required this.religion,
    required this.nik,
    required this.provinsiKode,
    required this.provinsiNama,
    required this.kotaKode,
    required this.kotaNama,
    required this.kecamatanKode,
    required this.kecamatanNama,
    required this.kelurahanKode,
    required this.kelurahanNama,
    required this.phone,
    required this.address,
    required this.picture,
    required this.notes,
    required this.createdBy,
    required this.createdName,
    required this.createdAt,
  });

  factory PemilihModel.fromMap(Map<String, dynamic> object) => PemilihModel(
        id: object['id'] ?? 0,
        name: object['name'] ?? '',
        gender: object['gender'] ?? '',
        bod: object['bod'] ?? '',
        religion: object['religion'] ?? '',
        nik: object['nik'] ?? '',
        provinsiKode: object['provinsi_kode'] ?? '',
        provinsiNama: object['provinsi_nama'] ?? '',
        kotaKode: object['kota_kode'] ?? '',
        kotaNama: object['kota_nama'] ?? '',
        kecamatanKode: object['kecamatan_kode'] ?? '',
        kecamatanNama: object['kecamatan_nama'] ?? '',
        kelurahanKode: object['kelurahan_kode'] ?? '',
        kelurahanNama: object['kelurahan_nama'] ?? '',
        phone: object['phone'] ?? '',
        address: object['address'] ?? '',
        picture: object['picture'] ?? '',
        notes: object['notes'] ?? '',
        createdBy: object['created_by'] ?? '',
        createdName: object['created_name'] ?? '',
        createdAt: object['created_at'] ?? '',
      );
}
