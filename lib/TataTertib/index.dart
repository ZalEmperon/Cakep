import 'package:cakapp/TataTertib/create.dart';
import 'package:cakapp/TataTertib/details.dart';
import 'package:cakapp/TataTertib/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class index_tata_tertib extends StatefulWidget {
  index_tata_tertib({Key? key}) : super(key: key);

  @override
  _index_tata_tertibState createState() => _index_tata_tertibState();
}

class _index_tata_tertibState extends State<index_tata_tertib> {
  final Stream<QuerySnapshot> tatatertibStream =
  FirebaseFirestore.instance.collection('tatatertib').snapshots();

  CollectionReference tatatertib =
  FirebaseFirestore.instance.collection('tatatertib');
  Future<void>deleteIndikator(id) {
    // print("User Deleted $id");
    return tatatertib
        .doc(id)
        .delete()
        .then((value) => print('Indikator Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  void showAlertDialog({id}){
    showDialog(builder: (context) => new AlertDialog(
      title: Text("Warning"),
      content: Text("Anda Yakin Ingin Menghapus?"),
      actions: <Widget>[
        new IconButton(icon: Icon(Icons.close), onPressed: (){
          Navigator.pop(context);
        }),
        new IconButton(icon: Icon(Icons.check, color: Colors.green,), onPressed: (){
          deleteIndikator(id);
          Navigator.pop(context);
        })
      ],
    ), context: context
    );
  }

  // TextEditingController _searchController = TextEditingController();
  //
  // @override
  // void iniState(){
  //   super.initState();
  //   _searchController.addListener(_onSearchChanged);
  // }
  //
  // @override
  // void dispose(){
  //   _searchController.removeListener(_onSearchChanged);
  //   _searchController.dispose();
  //   super.dispose();
  // }
  //
  // _onSearchChanged(){
  //   print(_searchController.text);
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: tatatertibStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          print('Something went wrong');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
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
            title: Text("Tata Tertib"),
          ),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Text("DATA INDIKATOR", style: TextStyle(fontSize:20 ),),
              ),
              new MaterialButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => tata_tertib_create()));
                }, child: Text("New Indikator"),
                color: Colors.red,
                textColor: Colors.white,
              ),

              Container(
                margin: EdgeInsets.all(20.0),
                width: 350.0,
                child: TextField(
                  //controller: _searchController,
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
                        DataColumn(label: Text("No")),
                        DataColumn(label: Text("Indikator")),
                        DataColumn(label: Text("Poin")),
                        DataColumn(label: Text("Aspek")),
                        DataColumn(label: Text("Action")),
                      ],
                      rows: <DataRow>[
                        for (var i = 0; i < storedocs.length; i++)...[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('$i')),
                              DataCell(Text(storedocs[i]['indikator'])),
                              DataCell(Text(storedocs[i]['poin'])),
                              DataCell(Text(storedocs[i]['aspek'])),
                              DataCell(Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      color: Colors.grey,
                                      tooltip: 'edit',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => tata_tertib_edit(
                                                id: storedocs[i]['id']),
                                          ),
                                        );
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
                                            builder: (context) => tata_tertib_detail(
                                                id: storedocs[i]['id']),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      color: Colors.grey,
                                      tooltip: 'remove',
                                      onPressed: () {
                                        showAlertDialog(id: storedocs[i]['id']);
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

            ]),
          ),
        );
      },
    );
  }
}