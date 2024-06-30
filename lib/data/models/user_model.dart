class UserModel {
  int id;
  String name;
  String email;
  String gender;
  String bod;
  String phone;
  String address;
  String picture;
  String expiredDate;
  int roleId;
  String roleName;
  int electionId;
  String electionCategory;
  String electionArea;
  String electionSubarea;
  int electionVotersAll;
  int electionVotersTarget;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.bod,
    required this.phone,
    required this.address,
    required this.picture,
    required this.expiredDate,
    required this.roleId,
    required this.roleName,
    required this.electionId,
    required this.electionCategory,
    required this.electionArea,
    required this.electionSubarea,
    required this.electionVotersAll,
    required this.electionVotersTarget,
  });

  factory UserModel.fromMap(Map<String, dynamic> object) => UserModel(
        id: object['id'] ?? 0,
        name: object['name'] ?? '',
        email: object['email'] ?? '',
        gender: object['gender'] ?? '',
        bod: object['bod'] ?? '',
        phone: object['phone'] ?? '',
        address: object['address'] ?? '',
        picture: object['picture'] ?? '',
        expiredDate: object['expired_date'] ?? '',
        roleId: object['role']['id'] ?? 0,
        roleName: object['role']['name'] ?? '',
        electionId: object['election']['id'] ?? 0,
        electionCategory: object['election']['category'] ?? '',
        electionArea: object['election']['area'] ?? '',
        electionSubarea: object['election']['subarea'] ?? '',
        electionVotersAll: object['election']['voters_all'] ?? 0,
        electionVotersTarget: object['election']['voters_target'] ?? 0,
      );
}
