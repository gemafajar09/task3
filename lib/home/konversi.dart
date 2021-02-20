import 'package:flutter/material.dart';
import 'package:task3/home/home.dart';

class Konversi extends StatefulWidget {
  Konversi({Key key}) : super(key: key);
  static const router = '/konversi';
  @override
  _KonversiState createState() => _KonversiState();
}

class _KonversiState extends State<Konversi> {
  var formKey = GlobalKey<FormState>();
  final _panjang = TextEditingController();
  final _konversi = TextEditingController();
  String pilihan1, pilihan2;
  int pecah1, pecah2;
  var hasil, tampung;
  List<String> satuan = [
    'kilometer',
    'hektometer',
    'dekameter',
    'meter',
    'desimeter',
    'centimeter',
    'milimeter'
  ];

  void carihasil1(var isi) {
    for (var i = 0; i < satuan.length; i++) {
      if (satuan[i] == pilihan1) {
        pecah1 = i + 1;
      }

      if (satuan[i] == pilihan2) {
        pecah2 = i + 1;
      }
    }

    if (pecah1 > pecah2) {
      tampung = pecah1 - pecah2;
      if (tampung == 0) {
        hasil = int.parse(isi) / 1;
      } else if (tampung == 1) {
        hasil = int.parse(isi) / 10;
      } else if (tampung == 2) {
        hasil = int.parse(isi) / 100;
      } else if (tampung == 3) {
        hasil = int.parse(isi) / 1000;
      } else if (tampung == 4) {
        hasil = int.parse(isi) / 10000;
      } else if (tampung == 5) {
        hasil = int.parse(isi) / 100000;
      } else if (tampung == 6) {
        hasil = int.parse(isi) / 1000000;
      } else if (tampung == 7) {
        hasil = int.parse(isi) / 10000000;
      }
      setState(() {
        _konversi.text = hasil.toString();
      });
      
    } else {
      tampung = pecah2 - pecah1;
      if (tampung == 0) {
        hasil = int.parse(isi) * 1;
      } else if (tampung == 1) {
        hasil = int.parse(isi) * 10;
      } else if (tampung == 2) {
        hasil = int.parse(isi) * 100;
      } else if (tampung == 3) {
        hasil = int.parse(isi) * 1000;
      } else if (tampung == 4) {
        hasil = int.parse(isi) * 10000;
      } else if (tampung == 5) {
        hasil = int.parse(isi) * 100000;
      } else if (tampung == 6) {
        hasil = int.parse(isi) * 1000000;
      } else if (tampung == 7) {
        hasil = int.parse(isi) * 10000000;
      }
      
      setState(() {
        _konversi.text = hasil.toString();
      });
    }
  }

  void carihasil2(var isi) {
    for (var i = 0; i < satuan.length; i++) {
      if (satuan[i] == pilihan1) {
        pecah1 = i + 1;
      }

      if (satuan[i] == pilihan2) {
        pecah2 = i + 1;
      }
    }

    if (pecah2 > pecah1) {
      tampung = pecah2 - pecah1;
      if (tampung == 0) {
        hasil = int.parse(isi) / 0;
      } else if (tampung == 1) {
        hasil = int.parse(isi) / 10;
      } else if (tampung == 2) {
        hasil = int.parse(isi) / 100;
      } else if (tampung == 3) {
        hasil = int.parse(isi) / 1000;
      } else if (tampung == 4) {
        hasil = int.parse(isi) / 10000;
      } else if (tampung == 5) {
        hasil = int.parse(isi) / 100000;
      } else if (tampung == 6) {
        hasil = int.parse(isi) / 1000000;
      } else if (tampung == 7) {
        hasil = int.parse(isi) / 10000000;
      }
      setState(() {
        _panjang.text = hasil.toString();
      });
      
    } else {
      tampung = pecah1 - pecah2;
      if (tampung == 0) {
        hasil = int.parse(isi) * 0;
      } else if (tampung == 1) {
        hasil = int.parse(isi) * 10;
      } else if (tampung == 2) {
        hasil = int.parse(isi) * 100;
      } else if (tampung == 3) {
        hasil = int.parse(isi) * 1000;
      } else if (tampung == 4) {
        hasil = int.parse(isi) * 10000;
      } else if (tampung == 5) {
        hasil = int.parse(isi) * 100000;
      } else if (tampung == 6) {
        hasil = int.parse(isi) * 1000000;
      } else if (tampung == 7) {
        hasil = int.parse(isi) * 10000000;
      }
      
      setState(() {
        _panjang.text = hasil.toString();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Konversi Satuan'),
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Home.router);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 1,
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Konversi Satuan",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 5),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: TextFormField(
                                onChanged: (isi) => carihasil1(isi),
                                controller: _panjang,
                                decoration: InputDecoration(
                                  hintText: '0',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                              ),
                            ),
                            // satuan
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width / 2.2,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                              ),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(5.0),
                                    ),
                                  ),
                                ),
                                hint: Text('-SELECT SATUAN-'),
                                value: pilihan1,
                                onChanged: (value) {
                                  setState(() {
                                    pilihan1 = value;
                                  });
                                },
                                items: satuan.map((item) {
                                  return DropdownMenuItem(
                                    child: new Text(item),
                                    value: item,
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )),
                    //  ======
                    SizedBox(
                      height: 20,
                    ),
                    // ======
                    Container(
                        margin: EdgeInsets.only(right: 5),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: TextFormField(
                                controller: _konversi,
                                onChanged: (isi) => carihasil2(isi),
                                decoration: InputDecoration(
                                  hintText: '0',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                              ),
                            ),
                            // satuan
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(5.0),
                                    ),
                                  ),
                                ),
                                hint: Text('-SELECT SATUAN-'),
                                value: pilihan2,
                                onChanged: (isi) {
                                  setState(() {
                                    pilihan2 = isi;
                                  });
                                },
                                items: satuan.map((item) {
                                  return DropdownMenuItem(
                                    child: new Text(item),
                                    value: item,
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
