import 'package:cakapp/PoinSiswaUser/create.dart';
import 'package:cakapp/PoinSiswaUser/detail.dart';
import 'package:cakapp/PoinSiswaUser/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PoinSiswaUser extends StatefulWidget {
  PoinSiswaUser({Key? key}) : super(key: key);

  @override
  _PoinSiswaUserState createState() => _PoinSiswaUserState();
}

class _PoinSiswaUserState extends State<PoinSiswaUser> {
  final Stream<QuerySnapshot> poinsiswaStream =
      FirebaseFirestore.instance.collection('poinsiswa').snapshots();

  CollectionReference poinsiswa =
      FirebaseFirestore.instance.collection('poinsiswa');

  Future<void> deletePoinsiswa(id) {
    // print("Deleted $id");
    return poinsiswa
        .doc(id)
        .delete()
        .then((value) => print('Poin Siswa Deleted'))
        .catchError((error) => print('Failed to Delete Poin Siswa: $error'));
  }

  void showAlertDialog({id}) {
    showDialog(
        builder: (context) => new AlertDialog(
              title: Text("Warning"),
              content: Text("Anda Yakin Ingin Menghapus?"),
              actions: <Widget>[
                new IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                new IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      deletePoinsiswa(id);
                      Navigator.pop(context);
                    })
              ],
            ),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return StreamBuilder<QuerySnapshot>(
      stream: poinsiswaStream,
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
            title: Text("Perolehan Poin"),
          ),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                  padding: new EdgeInsets.only(top: 20.0),
                  margin: EdgeInsets.all(8),
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return Table(
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
                                      "Nama Siswa",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                        snapshot.data?['namasiswa'] ?? "",
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
                                    child: Text(
                                      "NIS",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(19),
                                    child: Text(snapshot.data?['nis'] ?? "",
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
                                    child: Text(
                                      "Kelas",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(19),
                                    child: Text(snapshot.data?['kelas'] ?? "",
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      })),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              new MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => create()));
                },
                child: Text("Add"),
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
                            DataCell(
                              Row(children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.grey,
                                  tooltip: 'edit',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => edit_poin()));
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  color: Colors.grey,
                                  tooltip: 'detail',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                detail_poin()));
                                  },
                                ),
                              ]),
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
                            DataCell(
                              Row(children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.grey,
                                  tooltip: 'edit',
                                  onPressed: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             poin_siswa_edit()));
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  color: Colors.grey,
                                  tooltip: 'detail',
                                  onPressed: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             detail_poin()));
                                  },
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
