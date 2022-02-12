import 'package:cakapp/TataTertib/create.dart';
import 'package:cakapp/TataTertib/details.dart';
import 'package:cakapp/TataTertib/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class index_tata_tertib extends StatefulWidget {
  @override
  _index_tata_tertibState createState() => _index_tata_tertibState();
}

class _index_tata_tertibState extends State<index_tata_tertib> {
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
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text("1")),
                        DataCell(Text("Saya berbicara dengan bahasa yang baik dan santun dengan lawan bicara")),
                        DataCell(Text("10")),
                        DataCell(Text("Beriman, Bertaqwa Kepada Tuhan YME, dan Berakhlak Mulia")),
                        DataCell(Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.grey,
                                tooltip: 'edit',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => tata_tertib_edit() ));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.grey,
                                tooltip: 'detail',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => tata_tertib_detail() ));
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
                        DataCell(Text("2")),
                        DataCell(Text("Saya berusaha bersikap terbuka, mau menerima dan mampu beradaptasi dengan perkembangan teknologi")),
                        DataCell(Text("10")),
                        DataCell(Text("Berkebhinekaan Global")),
                        DataCell(Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.grey,
                                tooltip: 'edit',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => tata_tertib_edit() ));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.grey,
                                tooltip: 'detail',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => tata_tertib_detail() ));
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
                        DataCell(Text("3")),
                        DataCell(Text("Saya berbagi ilmu, informasi dan pengalaman yang bermanfaat kepada teman")),
                        DataCell(Text("10")),
                        DataCell(Text("Gotong Royong")),
                        DataCell(Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.grey,
                                tooltip: 'edit',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => tata_tertib_edit() ));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.grey,
                                tooltip: 'detail',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => tata_tertib_detail() ));
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
                        DataCell(Text("4")),
                        DataCell(Text("Saya bisa menemukan informasi yang dibutuhkan")),
                        DataCell(Text("10")),
                        DataCell(Text("Kreatif")),
                        DataCell(Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.grey,
                                tooltip: 'edit',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => tata_tertib_edit() ));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.grey,
                                tooltip: 'detail',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => tata_tertib_detail() ));
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

        ]),
      ),
    );
  }
}
