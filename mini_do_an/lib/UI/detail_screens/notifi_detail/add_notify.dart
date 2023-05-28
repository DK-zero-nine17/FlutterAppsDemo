import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:mini_do_an/Database/query_data.dart';
import 'package:mini_do_an/Model/post.dart';
import 'package:mini_do_an/UI/detail_screens/notifi_detail/carouse_slider.dart';

import '../../main_screens/notification_screen.dart';
import '../../root.dart';
import 'Item_DropDown.dart';
import 'seleted_Image.dart';

class AddOneNotify extends StatefulWidget {
  AddOneNotify({super.key});

  @override
  State<AddOneNotify> createState() => _AddOneNotifyState();
}

class _AddOneNotifyState extends State<AddOneNotify> {
  TextEditingController _userNameCtrl = TextEditingController();

  TextEditingController _tieudeCtrl = TextEditingController();

  TextEditingController _diadiemCtrl = TextEditingController();

  TextEditingController _noidungCtrl = TextEditingController();
  TextEditingController _thietbiCtrl = TextEditingController();
  String pathImage = '';
//////////////////////////////////////////////////////////

  List<String> _optionsA = [
    'Nặng',
    'Bình Thường',
    'Nhẹ',
  ];
  List<String> _optionsB = [
    'Cao',
    'Bình Thường',
    'Thấp',
  ];

  List<String> listDevices = [
    "bàn học",
    "cái ghế",
    "bảng đen",
    "máy chiếu",
    "camera",
    "máy tính",
    "chuột máy tính",
    "bàn phím máy tính",
    "máy lọc nước"
  ];

  String? _valueHuHong;
  String? _valueCanThiet;
  String? _thietbi;
  void getValueHuHong(String a) {
    _valueHuHong = a;
    print('muc do hu hong la $_valueHuHong');
  }

  void getValueCanThiet(String b) {
    _valueCanThiet = b;
    print('muc do can thiet la $_valueCanThiet');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<String> _listImageSelected = [];

  void getpathImage(String _pathImage) {
    setState(() {
      pathImage = _pathImage;
      //////////////////////////////////////////////////////
      _listImageSelected.add(pathImage);
      print('LIST ANH NHAN DUOC LA ${_listImageSelected.toString()}');
    });
  }

  Post handleOnClickPost(BuildContext context) {
    String _userName = _userNameCtrl.text;
    String _tieude = _tieudeCtrl.text;
    String _diadiem = _diadiemCtrl.text;
    String _noidung = _noidungCtrl.text;

    return Post(
        id: 0,
        idUser: 1,
        tieudePost: _tieude,
        nguoiguiPost: _userName,
        datePost: DateTime.now().toString(),
        noidungPost: _noidung,
        diachi: _diadiem,
        picturesPost: _listImageSelected.join(','),
        mdCanThiet: _valueCanThiet,
        mdHuHong: _valueHuHong,
        thietBi: _thietbi,
        //picturesPost: _listPic,
        // videosPost: _listPic,
        isLike: 1,
        soluongLike: 1,
        trangThai: 'chua xac dinh');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30,
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ),
                  )),
              Text(
                'Soạn thông báo',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: size.width * .3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 20,
                      child: Image.asset('assets/icons/attachment-clip.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          Post _newPost = handleOnClickPost(context);
                          DBProvider.db.newPost(_newPost);
                          //return NotificationScreen();
                          return RootScreen();
                        })));
                      },
                      child: Container(
                        width: 20,
                        child: Image.asset('assets/icons/send _add.png'),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: Image.asset('assets/icons/menu.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Từ: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: size.width * .7,
                    child: TextFormField(
                      controller: _userNameCtrl,
                      decoration: InputDecoration(
                        hintText: 'UserName',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                controller: _tieudeCtrl,
                decoration: InputDecoration(
                  hintText: 'Tiêu đề',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                controller: _diadiemCtrl,
                decoration: InputDecoration(
                  hintText: 'Địa điểm',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Thiết bị: ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Container(
                  //   height: 50,
                  //   width: 200,
                  //   child: TextFormField(
                  //     controller: _thietbiCtrl,
                  //     decoration:
                  //         InputDecoration(hintText: 'Nhập tên thiết bị'),
                  //   ),
                  // )
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Autocomplete<String>(
                        optionsBuilder: (textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable.empty();
                          }
                          return listDevices.where((element) {
                            return element
                                .contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (option) {
                          print('the $option was selected');
                          setState(() {
                            _thietbi = option;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              thickness: 1,
              height: 1,
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Mức độ hư hỏng: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ItemDropDown(
                    listOptions: _optionsA,
                    getValue: getValueHuHong,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Mức độ cần thiết: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ItemDropDown(
                    listOptions: _optionsB,
                    getValue: getValueCanThiet,
                  ),
                ],
              ),
            ),

            Divider(
              thickness: 1,
              height: 1,
            ),
            // Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 2),
            //       child: ClipRRect(
            //           borderRadius: BorderRadius.circular(10.0),
            //           child: Image.file(
            //             imageFile!,
            //             height: 300.0,
            //             width: double.infinity,
            //             fit: BoxFit.fill,
            //           )),
            //     ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                controller: _noidungCtrl,
                decoration: InputDecoration(
                  hintText: 'Nội dung',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SeletedImageScreen(pathImage: getpathImage),
          ],
        )),
      ),
    );
  }
}
