import 'package:cakapp/PoinSiswaUser/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class edit_poin extends StatefulWidget {
  @override
  _edit_poinState createState() => _edit_poinState();
}

class _edit_poinState extends State<edit_poin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Edit Poin Siswa"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget> [
              new TextField(
                readOnly: true,
                decoration: new InputDecoration(
                    hintText: "3103119151",
                    labelText: "NIS",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              new TextField(
                readOnly: true,
                decoration: new InputDecoration(
                    hintText: "Ragil Putri Rahmadani",
                    labelText: "Nama",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              new TextField(
                readOnly: true,
                decoration: new InputDecoration(
                    hintText: "XII RPL 5",
                    labelText: "Kelas",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItems: true,
                items: ["Beriman, Bertaqwa Kepada Tuhan YME, dan Berakhlak Mulia", "Berkebhinekaan Global", "Gotong Royong", "Kreatif", "Bernalar Kritis", "Mandiri"],
                label: "Aspek Indikator",
                hint: "Pilih Aspek Indikator",
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: print,
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              new TextField(
                readOnly: true,
                decoration: new InputDecoration(
                    hintText: "10",
                    labelText: "Poin",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 50.0),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new MaterialButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PoinSiswaUser() ));
                    }, child: Text("Back To List"),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                  new MaterialButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PoinSiswaUser() ));
                    }, child: Text("Save"),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
