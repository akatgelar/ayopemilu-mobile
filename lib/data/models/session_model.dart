class SessionModel {
  String token;
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
  int calegId;

  SessionModel({
    required this.token,
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
    required this.calegId,
  });

  factory SessionModel.fromMap(Map<String, dynamic> object) => SessionModel(
        token: object['token'] ?? '',
        id: object['id'] ?? 0,
        name: object['name'] ?? '',
        email: object['email'] ?? '',
        gender: object['gender'] ?? '',
        bod: object['bod'] ?? '',
        phone: object['phone'] ?? '',
        address: object['address'] ?? '',
        picture: object['picture'] ?? '',
        expiredDate: object['expiredDate'] ?? '',
        roleId: object['roleId'] ?? 0,
        roleName: object['roleName'] ?? '',
        electionId: object['electionId'] ?? 0,
        electionCategory: object['electionCategory'] ?? '',
        electionArea: object['electionArea'] ?? '',
        electionSubarea: object['electionSubarea'] ?? '',
        electionVotersAll: object['electionVotersAll'] ?? 0,
        electionVotersTarget: object['electionVotersTarget'] ?? 0,
        calegId: object['calegId'] ?? 0,
      );
}
