import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cakapp/datasiswa/UpdateSiswa.dart';

class ListDataSiswa extends StatefulWidget {
  ListDataSiswa({Key? key}) : super(key: key);

  @override
  _ListDataSiswaState createState() => _ListDataSiswaState();
}

class _ListDataSiswaState extends State<ListDataSiswa> {
  final Stream<QuerySnapshot> datasiswaStream =
  FirebaseFirestore.instance.collection('users').where('role',isEqualTo: 'siswa').snapshots();

  CollectionReference datasiswa =
  FirebaseFirestore.instance.collection('users');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return datasiswa
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: datasiswaStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
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

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(140),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(

                          child: Center(
                            child: Text(
                              'NIS',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(

                          child: Center(
                            child: Text(
                              'Nama Siswa',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(

                          child: Center(
                            child: Text(
                              'Kelas',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(

                          child: Center(
                            child: Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(

                          child: Center(
                            child: Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['nis'] ?? "",
                                  style: TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['namasiswa'] ?? "",
                                  style: TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['kelas'] ?? "",
                                  style: TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['username'] ?? "",
                                  style: TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateDataSiswa(id: storedocs[i]['id']),
                                    ),
                                  )
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                {deleteUser(storedocs[i]['id'])},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        });
  }
}
