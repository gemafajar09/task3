import 'package:flutter/material.dart';
import 'package:task3/home/home.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  static const router = '/splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 7)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/udacoding.png"),
                fit: BoxFit.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
