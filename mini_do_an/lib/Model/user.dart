import 'dart:convert';

class User {
  int id;
  int idAccount;
  String mssvUser;
  String nameUser;
  String emailUser;
  String? lopUser;
  String? sdtUser;
  String? dateUser;
  String? diachiUser;
  String? avatarUser;

  User({
    required this.id,
    required this.idAccount,
    required this.mssvUser,
    required this.nameUser,
    required this.emailUser,
    this.lopUser,
    this.sdtUser,
    this.dateUser,
    this.diachiUser,
    this.avatarUser,
  });

  factory User.fromMap(Map<String, dynamic> json) => new User(
      id: json["id"],
      idAccount: json["idAccount"],
      mssvUser: json["mssvUser"],
      nameUser: json["nameUser"],
      emailUser: json["emailUser"],
      lopUser: json["lopUser"],
      sdtUser: json["sdtUser"],
      dateUser: json["dateUser"],
      diachiUser: json["diachiUser"],
      avatarUser: json["avatarUser"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "idAccount": idAccount,
        "mssvUser": mssvUser,
        "nameUser": nameUser,
        "emailUser": emailUser,
        "lopUser": lopUser,
        "sdtUser": sdtUser,
        "dateUser": dateUser,
        "diachiUser": diachiUser,
        "avatarUser": avatarUser
      };
}

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromMap(jsonData);
}

String userToJson(User data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
