import 'package:cakapp/PoinSiswa/create.dart';
import 'package:cakapp/PoinSiswa/detail_poin.dart';
import 'package:cakapp/PoinSiswa/edit.dart';
import 'package:cakapp/PoinSiswa/index.dart';
import 'package:cakapp/TataTertib/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class poin_siswa_detail extends StatefulWidget {
  late final String id;
  poin_siswa_detail({Key? key, required this.id}) : super(key: key);
  @override
  _poin_siswa_detailState createState() => _poin_siswa_detailState();
}

class _poin_siswa_detailState extends State<poin_siswa_detail> {
  void showAlertDialog(){
    showDialog(builder: (context) => new AlertDialog(
      title: Text("Warning"),
      content: Text("Anda Yakin Ingin Menghapus?"),
      actions: <Widget>[
        new IconButton(icon: Icon(Icons.close), onPressed: (){
          Navigator.pop(context);
        }),
        new IconButton(icon: Icon(Icons.check, color: Colors.green,), onPressed: (){
          Navigator.pop(context);
        })
      ],
    ), context: context
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Detail Poin Siswa"),
      ),
      body:  Center(
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('siswa')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var nama = data!['nama'];
              var kelas = data['kelas'];
              var nis = data['nis'];

              return Padding(
                padding: new EdgeInsets.only(top: 20.0),
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
                                  child: Text(
                                    "Nama Siswa", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(19),
                                  child: Text(nama,
                                      textAlign: TextAlign.center),
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
                                  child: Text("NIS", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(19),
                                  child: Text(
                                      nis, textAlign: TextAlign.center),
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
                                  child: Text(
                                    "Kelas", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(19),
                                  child: Text(
                                      kelas, textAlign: TextAlign.center),
                                ),
                              ),
                            ],

                          )
                        ],
                      )
                  ),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                  ),
                  new MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => add_poin()));
                    }, child: Text("Add"),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        DataTable(
                          columns: <DataColumn>[
                            DataColumn(label: Text("Indikator")),
                            DataColumn(label: Text("Aspek")),
                            DataColumn(label: Text("Poin")),
                            DataColumn(label: Text("Tanggal")),
                            DataColumn(label: Text("Action")),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text(
                                    "Saya berbicara dengan bahasa yang baik dan santun dengan lawan bicara")),
                                DataCell(Text(
                                    "Beriman, Bertaqwa Kepada Tuhan YME, dan Berakhlak Mulia")),
                                DataCell(Text("10")),
                                DataCell(Text("9/17/2021 8:46:00 AM")),
                                DataCell(Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        color: Colors.grey,
                                        tooltip: 'edit',
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      poin_siswa_edit()));
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove_red_eye),
                                        color: Colors.grey,
                                        tooltip: 'detail',
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      detail_poin()));
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.grey,
                                        tooltip: 'remove',
                                        onPressed: () {
                                          showAlertDialog();
                                        },
                                      ),
                                    ]
                                ),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text(
                                    "Saya berbicara dengan bahasa yang baik dan santun dengan lawan bicara")),
                                DataCell(Text(
                                    "Beriman, Bertaqwa Kepada Tuhan YME, dan Berakhlak Mulia")),
                                DataCell(Text("10")),
                                DataCell(Text("9/17/2021 8:46:00 AM")),
                                DataCell(Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        color: Colors.grey,
                                        tooltip: 'edit',
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      poin_siswa_edit()));
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove_red_eye),
                                        color: Colors.grey,
                                        tooltip: 'detail',
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      detail_poin()));
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.grey,
                                        tooltip: 'remove',
                                        onPressed: () {
                                          showAlertDialog();
                                        },
                                      ),
                                    ]
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => poin_siswa()));
                    }, child: Text("Back To List"),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ]),
              );
            }),
      ),
    );
  }
}