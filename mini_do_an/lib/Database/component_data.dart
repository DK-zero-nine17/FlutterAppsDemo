class WriteData {
  //Name DataBase
  static final String DB_NAME = 'TestDK29.db';
  static final int DB_VERSION = 1;

  //Table Account
  static final String TBL_NAME_ACT = 'Account';
  static final String COL_ID_ACT = 'id';
  static final String COL_NAME_ACT = 'tenDNhap';
  static final String COL_PASSWORD_ACT = 'matKhau';

  //Table Comment
  static final String TBL_NAME_CMT = 'Comment';
  static final String COL_ID_CMT = 'id';
  static final String COL_ID_POST_CMT = 'idPost';
  static final String COL_ID_USER_CMT = 'idUser';
  static final String COL_DATE_CMT = 'dateComment';
  static final String COl_CONTENT_CMT = 'noidungComment';
  static final String COl_ISLIKE_CMT = 'isLike';
  static final String COL_SOLUONGLIKE_CMT = 'soluongLike';
  static final String COL_PICTURES_CMT = 'pictures';
  static final String COL_VIDEOS_CMT = 'videos';

  //Table Post
  static final String TBL_NAME_POST = 'Post';
  static final String COL_ID_POST = 'id';
  static final String COl_ID_USER_POST = 'idUser';
  static final String COL_TITLE_POST = 'tieudePost';
  static final String COl_NAME_SEND_POST = 'nguoiguiPost';
  static final String COL_DATE_POST = 'datePost';
  static final String COL_CONTENT_POST = 'noidungPost';
  static final String COL_PICTURES_POST = 'picturesPost';
  static final String COL_VIDEOS_POST = 'videosPost';
  static final String COL_ISLIKE_POST = 'isLike';
  static final String COL_SOLUONGLIKE_POST = 'soluongLike';
  static final String COL_TRANGTHAI_POST = 'trangThai';
  static final String COL_MDHUHONG_POST = 'mdHuHong';
  static final String COL_MDCANTHIET_POST = 'mdCanThiet';
  static final String COL_THIETBI_POST = 'thietBi';
  static final String COL_DIACHI_POST = 'diachi';

  // Table User
  static final String TBL_NAME_USER = 'TheUser';
  static final String COL_ID_USER = 'idUser';
  static final String COL_ID_ACCOUNT_USER = 'idAccountUser';
  static final String COL_MSSV_USER = 'mssvUser';
  static final String COL_NAME_USER = 'nameUser';
  static final String COL_EMAIL_USER = 'emailUser';
  static final String COL_LOP_USER = 'lopUser';
  static final String COL_SDT_USER = 'sdtUser';
  static final String COL_DATE_USER = 'dateUser';
  static final String COL_DIACHI_USER = 'diachiUser';
  static final String COL_AVATAR_USER = 'avatarUser';
}
