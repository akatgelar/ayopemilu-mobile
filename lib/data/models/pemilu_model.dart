class PemiluModel {
  int id;
  String category;
  String area;
  String subarea;
  int votersAll;
  int votersTarget;

  PemiluModel({
    required this.id,
    required this.category,
    required this.area,
    required this.subarea,
    required this.votersAll,
    required this.votersTarget,
  });

  factory PemiluModel.fromMap(Map<String, dynamic> object) => PemiluModel(
        id: object['id'] ?? 0,
        category: object['category'] ?? '',
        area: object['area'] ?? '',
        subarea: object['subarea'] ?? '',
        votersAll: object['voters_all'] ?? 0,
        votersTarget: object['voters_target'] ?? 0,
      );
}
