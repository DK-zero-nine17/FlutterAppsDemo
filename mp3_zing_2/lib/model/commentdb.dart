class CommentDB {
  String id;
  String urlAvatar;
  String nameUser;
  String date;
  String content;
  int numberLike;
  bool isLike;

  CommentDB(
      {required this.id,
      required this.urlAvatar,
      required this.nameUser,
      required this.content,
      required this.date,
      required this.numberLike,
      required this.isLike});
}
