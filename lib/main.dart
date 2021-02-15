import 'package:flutter/material.dart';
import 'package:task3/auth/Login.dart';
import 'package:task3/home/fisika.dart';
import 'package:task3/home/home.dart';
import 'package:task3/home/konversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = <String, WidgetBuilder>{
    Login.router : (context) => Login(),
    Home.router : (context) => Home(),
    Fisika.router : (context) => Fisika(),
    Konversi.router : (context) => Konversi()
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _router,
      initialRoute: Login.router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
