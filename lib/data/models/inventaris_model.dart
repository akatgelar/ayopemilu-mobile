class InventarisModel {
  int id;
  int electionId;
  String title;
  String amount;
  String unit;
  String price;
  String picture;
  String description;
  String createdAt;

  InventarisModel({
    required this.id,
    required this.electionId,
    required this.title,
    required this.amount,
    required this.unit,
    required this.price,
    required this.picture,
    required this.description,
    required this.createdAt,
  });

  factory InventarisModel.fromMap(Map<String, dynamic> object) => InventarisModel(
        id: object['id'] ?? 0,
        electionId: object['election_id'] ?? 0,
        title: object['title'] ?? '',
        amount: object['amount'] ?? '',
        unit: object['unit'] ?? '',
        price: object['price'] ?? '',
        picture: object['picture'] ?? '',
        description: object['description'] ?? '',
        createdAt: object['created_at'] ?? '',
      );
}
