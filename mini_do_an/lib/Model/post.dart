import 'dart:convert';

class Post {
  int id;
  int idUser;
  String tieudePost;
  String nguoiguiPost;
  String datePost;
  String noidungPost;
  String? picturesPost;
  List<String>? videosPost;
  int? isLike;
  int? soluongLike;
  String? trangThai;
  String? mdHuHong;
  String? mdCanThiet;
  String? thietBi;
  String? diachi;

  Post({
    required this.id,
    required this.idUser,
    required this.tieudePost,
    required this.nguoiguiPost,
    required this.datePost,
    required this.noidungPost,
    this.picturesPost,
    this.videosPost,
    this.isLike,
    this.soluongLike,
    this.trangThai,
    this.mdCanThiet,
    this.mdHuHong,
    this.thietBi,
    this.diachi,
  });

  factory Post.fromMap(Map<String, dynamic> json) => new Post(
        id: json["id"],
        idUser: json["idUser"],
        tieudePost: json["tieudePost"],
        nguoiguiPost: json["nguoiguiPost"],
        noidungPost: json["noidungPost"],
        datePost: json["datePost"],
        picturesPost: json["picturesPost"],
        //picturesPost: json["picturesPost"],
        //videosPost: json["videosPost"],

        // if (json['picturesPost'] != null) {
        //   picturesPost = <String>[];
        //   json['picturesPost'].forEach((v) {
        //     picturesPost!.add(jsonEncode(v));
        //   }),

        // },

        // if (json['videosPost'] != null) {
        //   videosPost = <String>[];
        //   json['videosPost'].forEach((v) {
        //     videosPost!.add(jsonEncode(v));
        //   }),
        // },
        isLike: json["isLike"],
        soluongLike: json["soluongLike"],
        trangThai: json["trangThai"],
        mdHuHong: json["mdHuHong"],
        mdCanThiet: json["mdCanThiet"],
        thietBi: json["thietBi"],
        diachi: json["diachi"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "idUser": idUser,
        "tieudePost": tieudePost,
        "nguoiguiPost": nguoiguiPost,
        "datePost": datePost,
        "noidungPost": noidungPost,
        "picturesPost": picturesPost,
        "videosPost": videosPost,
        "isLike": isLike,
        "soluongLike": soluongLike,
        "trangThai": trangThai,
        "mdHuhong": mdHuHong,
        "mdCanThiet": mdCanThiet,
        "thietBi": thietBi,
        "diachi": diachi,
      };
}

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromMap(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
