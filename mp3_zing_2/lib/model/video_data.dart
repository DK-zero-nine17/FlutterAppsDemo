import 'dart:convert';

class VideoData {
  int? articleId;
  int? userId;
  String? appellation;
  String? articleTypeName;
  String? nguoiDang;
  String? avatarNguoiDang;
  bool? isUserLike;
  String? ngayDang;
  String? ngayDangNumber;
  String? soDienThoaiLienHe;
  String? moTa;
  String? noteDate;
  String? mapLat;
  String? mapLng;
  int? tinhId;
  int? quanId;
  int? phuongId;
  String? khoiLuong;
  String? thoiGianThuGom;
  String? diaDiemThuGomPhuongQuan;
  String? diaDiemThuGomSoNhaTenDuong;
  String? diaDiemThuGom;
  int? categoryIdRac;
  String? loaiRacThuGom;
  List<String>? pictures;
  String? videoUrl;
  String? thumbnail;
  int? tongSoLuotXem;
  int? tongSoLuotLike;
  int? tongSoLuotComment;
  String? quyenRiengTu;
  int? quyenRiengTuId;

  VideoData(
      {this.articleId,
      this.userId,
      this.appellation,
      this.articleTypeName,
      this.nguoiDang,
      this.avatarNguoiDang,
      this.isUserLike,
      this.ngayDang,
      this.ngayDangNumber,
      this.soDienThoaiLienHe,
      this.moTa,
      this.noteDate,
      this.mapLat,
      this.mapLng,
      this.tinhId,
      this.quanId,
      this.phuongId,
      this.khoiLuong,
      this.thoiGianThuGom,
      this.diaDiemThuGomPhuongQuan,
      this.diaDiemThuGomSoNhaTenDuong,
      this.diaDiemThuGom,
      this.categoryIdRac,
      this.loaiRacThuGom,
      this.pictures,
      this.videoUrl,
      this.thumbnail,
      this.tongSoLuotXem,
      this.tongSoLuotLike,
      this.tongSoLuotComment,
      this.quyenRiengTu,
      this.quyenRiengTuId});

  VideoData.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    userId = json['user_id'];
    appellation = json['appellation'];
    articleTypeName = json['article_type_name'];
    nguoiDang = json['nguoi_dang'];
    avatarNguoiDang = json['avatar_nguoi_dang'];
    isUserLike = json['is_user_like'];
    ngayDang = json['ngay_dang'];
    ngayDangNumber = json['ngay_dang_number'];
    soDienThoaiLienHe = json['so_dien_thoai_lien_he'];
    moTa = json['mo_ta'];
    noteDate = json['note_date'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    tinhId = json['tinh_id'];
    quanId = json['quan_id'];
    phuongId = json['phuong_id'];
    khoiLuong = json['khoi_luong'];
    thoiGianThuGom = json['thoi_gian_thu_gom'];
    diaDiemThuGomPhuongQuan = json['dia_diem_thu_gom_phuong_quan'];
    diaDiemThuGomSoNhaTenDuong = json['dia_diem_thu_gom_so_nha_ten_duong'];
    diaDiemThuGom = json['dia_diem_thu_gom'];
    categoryIdRac = json['category_id_rac'];
    loaiRacThuGom = json['loai_rac_thu_gom'];
    if (json['pictures'] != null) {
      pictures = <String>[];
      json['pictures'].forEach((v) {
        pictures!.add(jsonEncode(v));
      });
    }
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    tongSoLuotXem = json['tong_so_luot_xem'];
    tongSoLuotLike = json['tong_so_luot_like'];
    tongSoLuotComment = json['tong_so_luot_comment'];
    quyenRiengTu = json['quyen_rieng_tu'];
    quyenRiengTuId = json['quyen_rieng_tu_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['user_id'] = this.userId;
    data['appellation'] = this.appellation;
    data['article_type_name'] = this.articleTypeName;
    data['nguoi_dang'] = this.nguoiDang;
    data['avatar_nguoi_dang'] = this.avatarNguoiDang;
    data['is_user_like'] = this.isUserLike;
    data['ngay_dang'] = this.ngayDang;
    data['ngay_dang_number'] = this.ngayDangNumber;
    data['so_dien_thoai_lien_he'] = this.soDienThoaiLienHe;
    data['mo_ta'] = this.moTa;
    data['note_date'] = this.noteDate;
    data['map_lat'] = this.mapLat;
    data['map_lng'] = this.mapLng;
    data['tinh_id'] = this.tinhId;
    data['quan_id'] = this.quanId;
    data['phuong_id'] = this.phuongId;
    data['khoi_luong'] = this.khoiLuong;
    data['thoi_gian_thu_gom'] = this.thoiGianThuGom;
    data['dia_diem_thu_gom_phuong_quan'] = this.diaDiemThuGomPhuongQuan;
    data['dia_diem_thu_gom_so_nha_ten_duong'] = this.diaDiemThuGomSoNhaTenDuong;
    data['dia_diem_thu_gom'] = this.diaDiemThuGom;
    data['category_id_rac'] = this.categoryIdRac;
    data['loai_rac_thu_gom'] = this.loaiRacThuGom;
    // if (this.pictures != null) {
    //   data['pictures'] = this.pictures!.map((v) => v.toJson()).toList();
    // }
    data['video_url'] = this.videoUrl;
    data['thumbnail'] = this.thumbnail;
    data['tong_so_luot_xem'] = this.tongSoLuotXem;
    data['tong_so_luot_like'] = this.tongSoLuotLike;
    data['tong_so_luot_comment'] = this.tongSoLuotComment;
    data['quyen_rieng_tu'] = this.quyenRiengTu;
    data['quyen_rieng_tu_id'] = this.quyenRiengTuId;
    return data;
  }
}
