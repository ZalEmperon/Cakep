import 'package:cakapp/TataTertib/index.dart';
import 'package:flutter/material.dart';
import 'package:cakapp/shared/navbk.dart';
import 'package:dropdown_search/dropdown_search.dart';

class tata_tertib_edit extends StatefulWidget {
  @override
  _tata_tertib_editState createState() => _tata_tertib_editState();
}

class _tata_tertib_editState extends State<tata_tertib_edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Edit Tata Tertib"),
        ),
        body: SingleChildScrollView(
          child: new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget> [
                new TextField(
                  maxLines: 3,
                  decoration: new InputDecoration(
                      hintText: "Indikator",
                      labelText: "Indikator",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)
                      )
                  ),
                  onChanged: (value){},
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "Poin",
                      labelText: "Poin",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)
                      )
                  ),
                  onChanged: (value){},
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItems: true,
                  items: ["Beriman, Bertaqwa Kepada Tuhan YME, dan Berakhlak Mulia", "Berkebhinekaan Global", "Gotong Royong", "Kreatif", "Bernalar Kritis", "Mandiri"],
                  label: "Aspek Indikator",
                  hint: "Aspek Indikator",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => index_tata_tertib() ));
                      }, child: Text("Save"),
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
