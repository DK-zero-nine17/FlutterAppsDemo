import 'package:app_login_demo/src/blocs/login_bloc.dart';
import 'package:app_login_demo/src/resources/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginBloc bloc = new LoginBloc();

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool _userInvalid = false;
  bool _passInvalid = false;
  var _userNameErr = "UserName invalid.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOGIN'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                // color: Colors.blue,
                child: Icon(
                  Icons.person,
                  size: 100,
                ),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
                margin: EdgeInsets.all(40),
              ),
              Container(
                child: Text(
                  'Hello \n Welcome Back',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.fromLTRB(40, 0, 40, 10),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 10),
                  child: StreamBuilder(
                    stream: bloc.userStream,
                    builder: (context, snapshot) => TextFormField(
                      controller: _userController,
                      decoration: InputDecoration(
                          hintText: 'User name:',
                          labelText: 'User Name*',
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          border: UnderlineInputBorder()),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    StreamBuilder(
                        stream: bloc.passStream,
                        builder: ((context, snapshot) => TextFormField(
                            obscureText: _showPass,
                            controller: _passController,
                            decoration: InputDecoration(
                              labelText: 'PassWord*',
                              hintText: 'Pass word',
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              border: UnderlineInputBorder(),
                            )))),
                    GestureDetector(
                        child: Text(
                          !_showPass ? "Hide" : 'Show',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        onTap: (() => onToggLeShowPass()))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 10),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _onSignInClick();
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Container(
                    child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'NewUser SignIn',
                      style: TextStyle(
                          color: Color.fromARGB(255, 45, 41, 41),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  onToggLeShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void _onSignInClick() {
    setState(() {
      if (bloc.isValidInfo(
          _userController.toString(), _passController.toString())) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      }
    });
  }
}
