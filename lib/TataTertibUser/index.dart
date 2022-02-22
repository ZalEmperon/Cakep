import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TataTertibUser extends StatefulWidget {
  TataTertibUser({Key? key}) : super(key: key);
  @override
  _TataTertibUserState createState() => _TataTertibUserState();
}

class _TataTertibUserState extends State<TataTertibUser> {
  final Stream<QuerySnapshot> tatatertibStream =
  FirebaseFirestore.instance.collection('tatatertib').snapshots();

  CollectionReference tatatertib =
  FirebaseFirestore.instance.collection('tatatertib');
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
                      ],
                      rows: <DataRow>[
                        for (var i = 0; i < storedocs.length; i++)...[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('$i')),
                              DataCell(Text(storedocs[i]['indikator'])),
                              DataCell(Text(storedocs[i]['poin'])),
                              DataCell(Text(storedocs[i]['aspek'])),
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
