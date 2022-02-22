import 'package:cakapp/TataTertib/index.dart';
import 'package:cakapp/TataTertib/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class tata_tertib_create extends StatefulWidget {
  tata_tertib_create({Key? key}) : super(key: key);
  @override
  _tata_tertib_createState createState() => _tata_tertib_createState();
}

class _tata_tertib_createState extends State<tata_tertib_create> {
  final _formKey = GlobalKey<FormState>();

  var indikator = "";
  var aspek = "";
  var poin = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final indikatorController = TextEditingController();
  final aspekController = TextEditingController();
  final poinController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    indikatorController.dispose();
    aspekController.dispose();
    poinController.dispose();
    super.dispose();
  }

  clearText() {
    indikatorController.clear();
    aspekController.clear();
    poinController.clear();
  }

  // Adding Student
  CollectionReference tatatertib = FirebaseFirestore.instance.collection('tatatertib');

  Future<void> addTataTertib() {
    return tatatertib
        .add({'indikator': indikator, 'aspek': aspek, 'poin': poin})
        .then((value) => print('Indikator Added'))
        .catchError((error) => print('Failed to Add Indikator: $error'));
  }

  @override
  Widget build(BuildContext context) {
    //final Tata_Tertib_Provider = Provider.of<tata_tertib_provider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Form Tata Tertib"),
        ),
        body: Form(
            key: _formKey,

            child: Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget> [
                  new TextField(
                    maxLines: 3,
                    decoration: new InputDecoration(
                        hintText: "Indikator",
                        labelText: "Indikator",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)
                        )
                    ),
                    controller: indikatorController,
                    //onChanged: (value) => Tata_Tertib_Provider.changeIndikator(value),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 20.0),),
                  new TextField(
                    decoration: new InputDecoration(
                        hintText: "Poin",
                        labelText: "Poin",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)
                        )
                    ),
                    controller: poinController,
                    //onChanged: (value) => Tata_Tertib_Provider.changePoin(value),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 20.0),),
                  new TextField(
                    decoration: new InputDecoration(
                        hintText: "Aspek",
                        labelText: "Aspek",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)
                        )
                    ),
                    controller: aspekController,
                    //onChanged: (value) => Tata_Tertib_Provider.changeAspek(value),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 50.0),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new MaterialButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => index_tata_tertib() ));
                        }, child: Text("Back To List"),
                        color: Colors.orange,
                        textColor: Colors.white,
                      ),
                      new MaterialButton(
                        onPressed: (){
                          setState(() {
                            indikator = indikatorController.text;
                            poin = poinController.text;
                            aspek = aspekController.text;
                            addTataTertib();
                            clearText();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => index_tata_tertib() ));
                          });

                        }, child: Text("Save"),
                        color: Colors.red,
                        textColor: Colors.black,
                      ),
                    ],
                  ),

                ],
              ),
            )
        )

    );
  }
}



