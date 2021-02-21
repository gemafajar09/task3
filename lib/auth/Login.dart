import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task3/home/splash.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  static const router = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool pengecekan = true;
  var formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  var msg = '';

  tampilPassword() {
    setState(() {
      pengecekan = !pengecekan;
    });
  }

  login() {
    if (_password.text.length < 6) {
      _password.clear();
      showToast('Maaf Password tidak boleh kurang dari 6 digit.');
    } else {
      if (_username.text == 'udacodingid') {
        if (_password.text == 'udacodingJaya2021') {
          _username.clear();
          _password.clear();
          Navigator.pushReplacementNamed(context, Splash.router);
        } else {
          _password.clear();
          showToast('Maaf Password Salah.');
        }
      } else {
        _username.clear();
        _password.clear();
        showToast('Maaf Username Salah.');
      }
    }
  }

  showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green[200],
        textColor: Colors.white);
  }

  Widget icon() {
    return Center(
      child: Image(
        width: MediaQuery.of(context).size.width / 2,
        image: AssetImage('asset/iconlogin.png'),
      ),
    );
  }

  Widget form() {
    return Column(
      children: [
        Center(
          child: Text(
            "Log In",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: Colors.white),
          child: TextFormField(
            controller: _username,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(32)),
          child: TextFormField(
            controller: _password,
            obscureText: pengecekan,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: tampilPassword,
                  icon: Icon(
                      pengecekan ? Icons.visibility_off : Icons.visibility),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32))),
          ),
        ),
        SizedBox(height: 24),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30),
          color: Colors.green[200],
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            onPressed: () {
              if (_username.text.isNotEmpty) {
                if (_password.text.isNotEmpty) {
                  login();
                } else {
                  showToast('Maaf Password Kosong.!');
                }
              } else {
                showToast('Maaf Username Kosong.!');
              }
            },
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: formKey,
        backgroundColor: Colors.green[100],
        resizeToAvoidBottomPadding: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.green[300],
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey,
                      )
                    ]),
                child: icon(),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height / 2.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey,
                      )
                    ]),
                child: form(),
              )
            ],
          ),
        ));
  }
}
