import 'dart:convert';

class Comment {
  int id;
  int idPost;
  int idUser;
  String dateComment;
  String noidungComment;
  bool isLike;
  int soluongLike;
  List<String> pictures;
  List<String> videos;

  Comment(
      {required this.id,
      required this.idPost,
      required this.idUser,
      required this.dateComment,
      required this.noidungComment,
      required this.isLike,
      required this.soluongLike,
      required this.pictures,
      required this.videos});

  factory Comment.fromMap(Map<String, dynamic> json) => new Comment(
        id: json["id"],
        idUser: json["idUser"],
        idPost: json["idPost"],
        dateComment: json["dateComment"],
        noidungComment: json["noidungComment"],
        pictures: json["pictures"],
        videos: json["videos"],
        // if (json['pictures'] != null) {
        //   pictures = <String>[];
        //   json['pictures'].forEach((v) {
        //     pictures!.add(jsonEncode(v));
        //   });
        // }

        // if (json['videos'] != null) {
        //   videos = <String>[];
        //   json['videos'].forEach((v) {
        //     videos!.add(jsonEncode(v));
        //   });
        // }
        isLike: json["isLike"],
        soluongLike: json["soluongLike"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "idPost": idPost,
        "idUser": idUser,
        "dateComment": dateComment,
        "noidungComment": noidungComment,
        "isLike": isLike,
        "soluongLike": soluongLike,
        "pictures": pictures,
        "videos": videos
      };
}

Comment commentFromJson(String str) {
  final jsonData = json.decode(str);
  return Comment.fromMap(jsonData);
}

String userToJson(Comment data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
