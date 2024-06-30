class PengeluaranModel {
  int id;
  int electionId;
  String title;
  String nominal;
  String picture;
  String description;
  String createdAt;

  PengeluaranModel({
    required this.id,
    required this.electionId,
    required this.title,
    required this.nominal,
    required this.picture,
    required this.description,
    required this.createdAt,
  });

  factory PengeluaranModel.fromMap(Map<String, dynamic> object) => PengeluaranModel(
        id: object['id'] ?? 0,
        electionId: object['election_id'] ?? 0,
        title: object['title'] ?? '',
        nominal: object['nominal'] ?? '',
        picture: object['picture'] ?? '',
        description: object['description'] ?? '',
        createdAt: object['created_at'] ?? '',
      );
}
