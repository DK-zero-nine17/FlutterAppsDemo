import 'package:flutter/material.dart';
import 'package:mini_do_an/Database/query_data.dart';
import 'package:mini_do_an/Model/account.dart';
import 'package:mini_do_an/Model/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _msvCtrl = TextEditingController();
  TextEditingController _hoCtrl = TextEditingController();
  TextEditingController _tenCtrl = TextEditingController();
  TextEditingController _lopCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _matkhauCtrl = TextEditingController();
  TextEditingController _mkAgainCtrl = TextEditingController();
  void getValueOfText(BuildContext context) {
    String mssv = _msvCtrl.text;
    String ho = _hoCtrl.text;
    String ten = _tenCtrl.text;
    String lop = _lopCtrl.text;
    String email = _emailCtrl.text;
    String matkhau = _matkhauCtrl.text;
    String matkhauAgain = _mkAgainCtrl.text;

    Account newAccount = Account(id: 0, tenDNhap: email, matKhau: matkhau);
    User newUser = User(
        id: 0,
        idAccount: 0,
        mssvUser: mssv,
        nameUser: '$ho$ten',
        emailUser: email,
        lopUser: lop);
    // DBProvider.db.newAccount(newAccount);
    DBProvider.db.newUser(newUser);
    // Future.delayed(const Duration(seconds: 3)).then((value) {

    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 20),
                child: Text(
                  'Đăng kí',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              FormSetInfor(size, 'Mã sinh viên', _msvCtrl),
              Container(
                width: size.width * .9,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white.withOpacity(.9),
                        child: TextFormField(
                            controller: _hoCtrl,
                            decoration: InputDecoration(
                                hintText: 'Họ',
                                labelText: 'Họ',
                                border: OutlineInputBorder())),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        width: size.width * .3,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white.withOpacity(.9),
                        child: TextFormField(
                            controller: _tenCtrl,
                            decoration: InputDecoration(
                                hintText: 'Tên ',
                                labelText: 'Tên',
                                border: OutlineInputBorder())),
                      ),
                    )
                  ],
                ),
              ),
              FormSetInfor(size, 'Lớp', _lopCtrl),
              FormSetInfor(size, 'Email(Cũng là tên đăng nhập)', _emailCtrl),
              FormSetInfor(size, 'Mật khẩu', _matkhauCtrl),
              FormSetInfor(size, 'Xác nhận lại Mật khẩu', _mkAgainCtrl),
              Container(
                  height: 50,
                  width: size.width * .9,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        getValueOfText(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    child: Text(
                      'Đăng kí',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: size.width * .6,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        'Bạn đã có tài khoản ư?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Container FormSetInfor(
      Size size, String _option, TextEditingController _textCtrl) {
    return Container(
      height: 50,
      width: size.width * .9,
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white.withOpacity(.9),
      child: TextFormField(
        controller: _textCtrl,
        decoration: InputDecoration(
          hintText: '$_option',
          labelText: _option,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
