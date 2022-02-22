import 'package:cakapp/TataTertib/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class tata_tertib_edit extends StatefulWidget {
  late final String id;
  tata_tertib_edit({Key? key, required this.id}) : super(key: key);
  @override
  _tata_tertib_editState createState() => _tata_tertib_editState();
}

class _tata_tertib_editState extends State<tata_tertib_edit> {
  final _formKey = GlobalKey<FormState>();

  CollectionReference tatatertib =
  FirebaseFirestore.instance.collection('tatatertib');

  Future<void> updateUser(id, indikator, poin, aspek) {
    return tatatertib
        .doc(id)
        .update({'indikator': indikator, 'poin': poin, 'aspek': aspek})
        .then((value) => print("Data Indikator Updated"))
        .catchError((error) => print("Failed to update data indikator: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Edit Tata Tertib"),
        ),
        body: Form(
            key: _formKey,
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('tatatertib')
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
                  var indikator = data!['indikator'];
                  var poin = data['poin'];
                  var aspek = data['aspek'];
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new ListView(
                      children: <Widget>[
                        new TextFormField(
                          initialValue: indikator,
                          maxLines: 3,
                          autofocus: false,
                          onChanged: (value) => indikator = value,
                          decoration: new InputDecoration(
                            labelText: 'Indikator',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0)
                            ),
                            errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Indikator';
                            }
                            return null;
                          },
                        ),
                        new Padding(padding: new EdgeInsets.only(top: 20.0),),
                        new TextFormField(
                          initialValue: poin,
                          autofocus: false,
                          onChanged: (value) => poin = value,
                          decoration: new InputDecoration(
                            labelText: 'Poin',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0)
                            ),
                            errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Poin';
                            }
                            return null;
                          },
                        ),

                        new Padding(padding: new EdgeInsets.only(top: 20.0),),
                        new TextFormField(
                          initialValue: aspek,
                          autofocus: false,
                          onChanged: (value) => aspek = value,
                          decoration: new InputDecoration(
                            labelText: 'Aspek',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0)
                            ),
                            errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Aspek';
                            }
                            return null;
                          },
                        ),
                        new Padding(padding: new EdgeInsets.only(top: 50.0),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new MaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => index_tata_tertib()));
                              }, child: Text("Back To List"),
                              color: Colors.orange,
                              textColor: Colors.white,
                            ),
                            new MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  updateUser(widget.id, indikator, poin, aspek);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => index_tata_tertib()));
                                }

                              }, child: Text("Save"),
                              color: Colors.red,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                })
        )
    );
  }
}