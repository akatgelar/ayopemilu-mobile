class LaporanModel {
  int id;
  int electionId;
  String title;
  String picture;
  String description;
  String feedback;
  String status;
  String createdAt;
  String updatedAt;
  int createdBy;
  String createdName;
  int updatedBy;
  String updatedName;

  LaporanModel({
    required this.id,
    required this.electionId,
    required this.title,
    required this.picture,
    required this.description,
    required this.feedback,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.createdName,
    required this.updatedBy,
    required this.updatedName,
  });

  factory LaporanModel.fromMap(Map<String, dynamic> object) => LaporanModel(
        id: object['id'] ?? 0,
        electionId: object['election_id'] ?? 0,
        title: object['title'] ?? '',
        picture: object['picture'] ?? '',
        description: object['description'] ?? '',
        feedback: object['feedback'] ?? '',
        status: object['status'] ?? '',
        createdAt: object['created_at'] ?? '',
        updatedAt: object['updated_at'] ?? '',
        createdBy: object['created_by'] ?? 0,
        createdName: object['created_name'] ?? '',
        updatedBy: object['updated_by'] ?? 0,
        updatedName: object['updated_name'] ?? '',
      );
}
