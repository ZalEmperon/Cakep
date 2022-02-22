import 'package:cakapp/PoinSiswa/details.dart';
import 'package:cakapp/TataTertib/index.dart';
import 'package:flutter/material.dart';

class detail_poin extends StatefulWidget {
  @override
  _detail_poinState createState() => _detail_poinState();
}

class _detail_poinState extends State<detail_poin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Detail Poin Indikator"),
        ),
        body:  SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(8),
                child: Table(
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  columnWidths: {
                    0: FixedColumnWidth(380),

                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("NIS", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("3103119151", textAlign: TextAlign.center),
                          ),
                        ),
                      ],

                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("Nama", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("Intan Dewi Hapsari", textAlign: TextAlign.center),
                          ),
                        ),
                      ],

                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("Kelas", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("XII RPL 3", textAlign: TextAlign.center),
                          ),
                        ),
                      ],

                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("Indikator", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("Saya berbicara dengan bahasa yang baik dan santun dengan lawan bicara", textAlign: TextAlign.center),
                          ),
                        ),
                      ],

                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("Poin", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(19),
                            child: Text("10", textAlign: TextAlign.center),
                          ),
                        ),
                      ],

                    )
                  ],
                )
            ),
            new MaterialButton(
              onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => poin_siswa_detail() ));
              }, child: Text("Back To List"),
              color: Colors.orange,
              textColor: Colors.white,
            ),
          ]),
        )
    );
  }
}