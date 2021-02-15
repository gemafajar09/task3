import 'package:flutter/material.dart';
import 'package:task3/auth/Login.dart';
import 'package:task3/home/fisika.dart';
import 'package:task3/home/konversi.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  static const router = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  logout() {
    Navigator.pushReplacementNamed(context, Login.router);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Task 3 Udacoding"),
        actions: [IconButton(icon: Icon(Icons.logout), 
        onPressed: () {
          logout();
        }),
        ],
      ),
      // body
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height / 4,
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 2,
          crossAxisCount: 2,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Fisika.router);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage('asset/fisika.png'),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.grey,
                            )
                          ]),
                    ),
                    Center(
                      child: Text(
                        "Hitung Fisika",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // satuan panjang
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Konversi.router);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage('asset/satuan.png'),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.grey,
                            )
                          ]),
                    ),
                    Center(
                      child: Text(
                        "Konversi Nilai",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}
