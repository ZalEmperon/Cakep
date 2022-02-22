import 'package:cakapp/PoinSiswa/create.dart';
import 'package:cakapp/PoinSiswa/details.dart';
import 'package:cakapp/PoinSiswa/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class poin_siswa extends StatefulWidget {
  poin_siswa({Key? key}) : super(key: key);

  @override
  _poin_siswaState createState() => _poin_siswaState();
}

class _poin_siswaState extends State<poin_siswa> {
  final Stream<QuerySnapshot> siswaStream =
  FirebaseFirestore.instance.collection('siswa').snapshots();


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: siswaStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text("Poin Siswa"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "DATA POIN SISWA", style: TextStyle(fontSize: 20),),
                  ),

                  Container(
                    margin: EdgeInsets.all(20.0),
                    width: 350.0,
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(7.0),
                          hintText: "Search...",
                          labelText: "Search",
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 20.0,
                            onPressed: () {},
                          )
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        DataTable(
                          columns: <DataColumn>[
                            DataColumn(label: Text("NIS")),
                            DataColumn(label: Text("Nama")),
                            DataColumn(label: Text("Kelas")),
                            DataColumn(label: Text("Jumlah Poin")),
                            DataColumn(label: Text("Action")),
                          ],
                          rows: <DataRow>[
                            for (var i = 0; i < storedocs.length; i++)...[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(storedocs[i]['nis'])),
                                  DataCell(Text(storedocs[i]['nama'])),
                                  DataCell(Text(storedocs[i]['kelas'])),
                                  DataCell(Text("50")),
                                  DataCell(Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          color: Colors.grey,
                                          tooltip: 'detail',
                                          onPressed: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => poin_siswa_detail(id: storedocs[i]['id']),
                                              ),
                                            )
                                          },
                                        ),
                                      ]
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });

  }
}