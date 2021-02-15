import 'package:flutter/material.dart';
import 'package:task3/home/home.dart';

class Fisika extends StatefulWidget {
  Fisika({Key key}) : super(key: key);
  static const router = '/fisika';
  @override
  _FisikaState createState() => _FisikaState();
}

class _FisikaState extends State<Fisika> {
  var formKey = GlobalKey<FormState>();
  final _panjang = TextEditingController();
  final _lebar = TextEditingController();
  final _panjangVolume = TextEditingController();
  final _lebarVolume = TextEditingController();
  final _tinggiVolume = TextEditingController();
  var luas;
  var volume;

  @override
  void initState() {
    volume = 0;
    luas = 0;
    super.initState();
  }

  void hitungLuas() {
    double pjg, lbr;
    pjg = double.parse(_panjang.text);
    lbr = double.parse(_lebar.text);
    setState(() {
      /* 
          satuan panjang dan lebar itu adalah meter yang nantinya akan dijadikan ke meter persegi (m2) maka dikali 100
        */
      _panjang.clear();
      _lebar.clear();
      volume = 0;
      luas = (pjg * lbr) * 100;
    });
  }

  void hitungVolume() {
    double vpjg, vlbr, vtig;
    vpjg = double.parse(_panjangVolume.text);
    vlbr = double.parse(_lebarVolume.text);
    vtig = double.parse(_tinggiVolume.text);
    
    setState(() {
      /* 
          satuan panjang dan lebar itu adalah meter yang nantinya akan dijadikan ke kubik (m3) maka dikali 1000
        */
      _panjangVolume.clear();
      _lebarVolume.clear();
      _tinggiVolume.clear();
      luas = 0;
      volume = (vpjg * vlbr * vtig) * 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Hitung Fisika'),
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Home.router);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 8,
              child: Column(
                children: [
                  Text(
                    "Hitung Luas",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 2.7,
                    color: Colors.white70,
                    child: Column(
                      children: [
                        Container(
                          child: TextField(
                            controller: _panjang,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Panjang',
                              suffixIcon: Icon(Icons.mode_outlined),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextField(
                            controller: _lebar,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Lebar',
                              suffixIcon: Icon(Icons.mode_outlined),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[100],
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              onPressed: () {
                                hitungLuas();
                              },
                              child: Text(
                                'Hitung Luas',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Luas adalah : $luas",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // volume
            Card(
              elevation: 8,
              child: Column(
                children: [
                  Text(
                    "Hitung Volume",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 2,
                    color: Colors.white70,
                    child: Column(
                      children: [
                        Container(
                          child: TextField(
                            controller: _panjangVolume,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Panjang',
                              suffixIcon: Icon(Icons.mode_outlined),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextField(
                            controller: _lebarVolume,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Lebar',
                              suffixIcon: Icon(Icons.mode_outlined),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextField(
                            controller: _tinggiVolume,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tinggi',
                              suffixIcon: Icon(Icons.mode_outlined),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[100],
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              onPressed: () {
                                hitungVolume();
                              },
                              child: Text(
                                'Hitung Volume',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Volume adalah : $volume",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
