class RelawanModel {
  int id;
  String name;
  String email;
  String gender;
  String bod;
  String phone;
  String address;
  String picture;
  String expiredDate;
  String notes;
  String createdName;
  String createdAt;

  RelawanModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.bod,
    required this.phone,
    required this.address,
    required this.picture,
    required this.expiredDate,
    required this.notes,
    required this.createdName,
    required this.createdAt,
  });

  factory RelawanModel.fromMap(Map<String, dynamic> object) => RelawanModel(
        id: object['id'] ?? 0,
        name: object['name'] ?? '',
        email: object['email'] ?? '',
        gender: object['gender'] ?? '',
        bod: object['bod'] ?? '',
        phone: object['phone'] ?? '',
        address: object['address'] ?? '',
        picture: object['picture'] ?? '',
        expiredDate: object['expired_date'] ?? '',
        notes: object['notes'] ?? '',
        createdName: object['created_name'] ?? '',
        createdAt: object['created_at'] ?? '',
      );
}
