import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/account.dart';
import '../Model/comment.dart';
import '../Model/post.dart';
import '../Model/user.dart';
import 'component_data.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, '${WriteData.DB_NAME}');

    print('Database path: $path');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE Client ("
        "id INTEGER PRIMARY KEY,"
        "first_name TEXT,"
        "last_name TEXT,"
        "blocked BIT"
        ")",
      );
      // create table Acount
      await db.execute('''
        create table ${WriteData.TBL_NAME_ACT} (
        ${WriteData.COL_ID_ACT}  INTEGER PRIMARY KEY AUTOINCREMENT,
        ${WriteData.COL_NAME_ACT} TEXT NOT NULL ,
        ${WriteData.COL_PASSWORD_ACT}  TEXT NOT NULL
     
        );
        ''');

      // create table USER
      await db.execute('''
        
        create table ${WriteData.TBL_NAME_USER} (
        ${WriteData.COL_ID_USER} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${WriteData.COL_ID_ACCOUNT_USER} INTEGER NOT NULL,
        ${WriteData.COL_MSSV_USER} TEXT NOT NULL ,
        ${WriteData.COL_NAME_USER} TEXT NOT NULL ,
        ${WriteData.COL_EMAIL_USER} TEXT NOT NULL ,
        ${WriteData.COL_LOP_USER} TEXT ,
        ${WriteData.COL_SDT_USER} TEXT,
        ${WriteData.COL_DATE_USER} TEXT ,
        ${WriteData.COL_DIACHI_USER} TEXT,
        ${WriteData.COL_AVATAR_USER} TEXT ,
        FOREIGN KEY (${WriteData.COL_ID_ACCOUNT_USER}) REFERENCES ${WriteData.TBL_NAME_ACT}(${WriteData.COL_ID_ACT})
        );
        ''');

      //create table Post
      await db.execute('''
        create table ${WriteData.TBL_NAME_POST}(
        ${WriteData.COL_ID_POST} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${WriteData.COl_ID_USER_POST} INTEGER  ,
        ${WriteData.COL_TITLE_POST} TEXT  ,
        ${WriteData.COl_NAME_SEND_POST} TEXT  ,
        ${WriteData.COL_DATE_POST} TEXT  ,
        ${WriteData.COL_CONTENT_POST} TEXT  ,
        ${WriteData.COL_PICTURES_POST} TEXT  ,
        ${WriteData.COL_VIDEOS_POST} TEXT  ,
       ${WriteData.COL_ISLIKE_POST} BIT default  0, 
        ${WriteData.COL_SOLUONGLIKE_POST} INTEGER ,
        ${WriteData.COL_TRANGTHAI_POST} TEXT ,
        ${WriteData.COL_MDHUHONG_POST} TEXT ,
        ${WriteData.COL_MDCANTHIET_POST} TEXT ,
        ${WriteData.COL_THIETBI_POST} TEXT ,
          ${WriteData.COL_DIACHI_POST} TEXT ,
        FOREIGN KEY (${WriteData.COl_ID_USER_POST}) REFERENCES ${WriteData.TBL_NAME_USER}(${WriteData.COL_ID_USER})
        );

        ''');

      //create table Comment
      await db.execute('''
        create table  ${WriteData.TBL_NAME_CMT} (
         ${WriteData.COL_ID_CMT} INTEGER PRIMARY KEY AUTOINCREMENT,
         ${WriteData.COL_ID_POST_CMT} INTEGER,
         ${WriteData.COL_ID_USER_CMT} INTEGER,
         ${WriteData.COL_DATE_CMT} TEXT  ,
         ${WriteData.COl_CONTENT_CMT} TEXT  ,
         ${WriteData.COl_ISLIKE_CMT} BIT,
         ${WriteData.COL_SOLUONGLIKE_CMT} INTEGER,
         ${WriteData.COL_PICTURES_CMT} TEXT,
         ${WriteData.COL_VIDEOS_CMT} TEXT  ,
        FOREIGN KEY (${WriteData.COL_ID_USER_CMT}) REFERENCES ${WriteData.TBL_NAME_USER}(${WriteData.COL_ID_USER}),
        FOREIGN KEY (${WriteData.COL_ID_POST_CMT}) REFERENCES ${WriteData.TBL_NAME_POST}(${WriteData.COL_ID_POST})
        );

    ''');
    });
  }

//ACCOUNT
  //Insert new data of ACCOUNT in DB
  // newAccount(Account newAccount) async {
  //   final db = await database;
  //   var res = await db!.insert("${WriteData.TBL_NAME_ACT}", newAccount.toMap());
  //   return res;
  // }

  newAccount(Account newAccount) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db!.rawQuery("SELECT MAX(id)+1 as id FROM Account");
    Object? id = table.first["id"];
    print('id cua Account la $id');
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into   Account(id,tenDNhap,matKhau)"
        " VALUES (?,?,?)",
        [id, newAccount.tenDNhap, newAccount.matKhau]);
    return raw;
  }

  // get data of a Account in DB from ID
  getAccount(int id) async {
    final db = await database;
    var res = await db!
        .query("${WriteData.TBL_NAME_ACT}", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Account.fromMap(res.first) : Null;
  }

  // get data all of Account in DB
  Future<List<Account>> getAllAccount() async {
    final db = await database;
    var res = await db!.query("${WriteData.TBL_NAME_ACT}");
    List<Account> list =
        res.isNotEmpty ? res.map((c) => Account.fromMap(c)).toList() : [];
    return list;
  }

  // delete a Account in DB
  deleteAccount(int id) async {
    final db = await database;
    db!.delete("${WriteData.TBL_NAME_ACT}", where: "id = ?", whereArgs: [id]);
  }

  // update a Account in DB
  updateAccount(Account newAcount) async {
    final db = await database;
    var res = await db!.update("${WriteData.TBL_NAME_ACT}", newAcount.toMap(),
        where: "id = ?", whereArgs: [newAcount.id]);
    return res;
  }

//COMMENT
  //Insert new data of COMMENT in DB
  newComment(Comment newComment) async {
    final db = await database;
    var res = await db!.insert("${WriteData.TBL_NAME_CMT}", newComment.toMap());
    return res;
  }

  // get data of a Comment in DB from ID
  getComment(int id) async {
    final db = await database;
    var res = await db!
        .query("${WriteData.TBL_NAME_CMT}", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Comment.fromMap(res.first) : [];
  }

  // get data all of Comment in DB
  Future<List<Comment>> getAllComment() async {
    final db = await database;
    var res = await db!.query("${WriteData.TBL_NAME_CMT}");
    List<Comment> list =
        res.isNotEmpty ? res.map((c) => Comment.fromMap(c)).toList() : [];
    return list;
  }

  // delete a Comment in DB
  deleteComment(int id) async {
    final db = await database;
    db!.delete("${WriteData.TBL_NAME_CMT}", where: "id = ?", whereArgs: [id]);
  }

  // update a Account in DB
  updateComment(Comment newComment) async {
    final db = await database;
    var res = await db!.update("${WriteData.TBL_NAME_CMT}", newComment.toMap(),
        where: "id = ?", whereArgs: [newComment.id]);
    return res;
  }

//POST
  //Insert new data of POST in DB
  // newPost(Post newPost) async {
  //   final db = await database;
  //   var res = await db!.insert("${WriteData.TBL_NAME_POST}", newPost.toMap());
  //   return res;
  // }

  newPost(Post newPost) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db!.rawQuery("SELECT MAX(id)+1 as id FROM Post");
    Object? id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into   Post(  id,idUser,tieudePost, nguoiguiPost,datePost,noidungPost,picturesPost,isLike,soluongLike,trangThai, mdCanThiet,mdHuHong,thietBi,diachi)"
        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        [
          id,
          newPost.idUser,
          newPost.tieudePost,
          newPost.nguoiguiPost,
          newPost.datePost,
          newPost.noidungPost,
          newPost.picturesPost,
          newPost.isLike,
          newPost.soluongLike,
          newPost.trangThai,
          newPost.mdCanThiet,
          newPost.mdHuHong,
          newPost.thietBi,
          newPost.diachi
        ]);
    return raw;
  }

  //get length of Post
  getLengthPost() async {
    final db = await database;
    var res = await db!.rawQuery('SELECT COUNT(*) FROM Post');
    final count = Sqflite.firstIntValue(res);
    return count ?? 0;
    //return res.isNotEmpty ? Post.fromMap(res.first) : Null;
  }

  //get post
  Future<List<Post>> getPostWithQuery(String query) async {
    final db = await database;
    var res = await db!.rawQuery("select *  from Post " + query);
    List<Post> list =
        res.isNotEmpty ? res.map((c) => Post.fromMap(c)).toList() : [];
    return list;
  }

  //get thietBi, diachi, soluongLike of the Post
  Future<List<Post>> getInforListLienQuanPost(
      int idCurrent, String thietBi, String diachi) async {
    return getPostWithQuery(
        "where thietBi = '$thietBi' and diachi = '$diachi' and id != $idCurrent order by soluongLike desc");
  }
  // select COUNT(*)  FROM Post;

//  getTableLength(Database database, String tableName) async {
//   final result = await database.rawQuery('SELECT COUNT(*) FROM $tableName');
//   final count = Sqflite.firstIntValue(result);
//   return count ?? 0;
// }

  // get data of a Post in DB from ID
  // getPost(int id) async {
  //   final db = await database;
  //   var res = await db!
  //       .query("${WriteData.TBL_NAME_POST}", where: "id = ?", whereArgs: [id]);
  //   return res.isNotEmpty ? Post.fromMap(res.first) : Null;
  // }
  // Future<Post> getPost(int id) async {
  //   return getPostWithQuery("where id=$id").then((value) => value[0] );
  // }

  // get data all of Post in DB
  Future<List<Post>> getAllPost() async {
    return getPostWithQuery("group by thietBi,diachi order by datePost desc");
  }

  // delete a pOST in DB
  deletePost(int id) async {
    final db = await database;
    db!.delete("${WriteData.TBL_NAME_POST}", where: "id = ?", whereArgs: [id]);
  }

  // update a Account in DB
  updatePost(Post newPost) async {
    final db = await database;
    var res = await db!.update("${WriteData.TBL_NAME_POST}", newPost.toMap(),
        where: "id = ?", whereArgs: [newPost.id]);
    return res;
  }

//User
  //Insert new data of User in DB
  // newUser(User newUser) async {
  //   final db = await database;
  //   var res = await db!.insert("${WriteData.TBL_NAME_USER}", newUser.toMap());
  //   return res;
  // }

  newUser(User newUser) async {
    final db = await database;
    //get the biggest id in the table
    var table =
        await db!.rawQuery("SELECT MAX(idUser)+1 as idUser FROM TheUser");
    print(table.length);
    Object? idUser = table.first['idUser'];
    print('id cua user la $idUser ');
    // tao gia tri khoi dau
    if (idUser == null) {
      idUser = 1;
    }

    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into  TheUser( idUser,idAccountUser, mssvUser, nameUser, emailUser, lopUser)"
        " VALUES (?,?,?,?,?,?)",
        [
          idUser,
          idUser,
          newUser.mssvUser,
          newUser.nameUser,
          newUser.emailUser,
          newUser.lopUser
        ]);
    print('id22222222222222 cua user la $idUser ');
    return raw;
  }

  // get data of a User in DB from ID
  getUser(int id) async {
    final db = await database;
    var res = await db!
        .query("${WriteData.TBL_NAME_USER}", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? User.fromMap(res.first) : Null;
  }

  // get data all of USER in DB
  Future<List<User>> getAllUser() async {
    final db = await database;
    var res = await db!.query("${WriteData.TBL_NAME_USER}");
    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : [];
    return list;
  }

  // delete a User in DB
  deleteUser(int id) async {
    final db = await database;
    db!.delete("${WriteData.TBL_NAME_USER}", where: "id = ?", whereArgs: [id]);
  }

  // update a User in DB
  updateUser(User newUser) async {
    final db = await database;
    var res = await db!.update("${WriteData.TBL_NAME_USER}", newUser.toMap(),
        where: "id = ?", whereArgs: [newUser.id]);
    return res;
  }
}
