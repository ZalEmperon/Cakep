import 'package:cakapp/TataTertib/index.dart';
import 'package:flutter/material.dart';

class tata_tertib_detail extends StatefulWidget {
  @override
  _tata_tertib_detailState createState() => _tata_tertib_detailState();
}

class _tata_tertib_detailState extends State<tata_tertib_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Form Detail Tata Tertib"),
    ),
    body:  Center(
        child: Column(children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 20.0),),
          Container(
              child: Table(
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
                    child: Text("Indikator", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(19),
                    child: Text("Saya berbicara dengan bahasa yang baik dan santun dengan lawan bicara", textAlign: TextAlign.center),
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
                    child: Text("Poin", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(19),
                    child: Text("10", textAlign: TextAlign.center),
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
                    child: Text("Aspek", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(19),
                    child: Text("Beriman, Bertaqwa Kepada Tuhan YME, dan Berakhlak Mulia", textAlign: TextAlign.center),
                  ),
                ),
              ],

            )
          ],
        )
            ),
          new Padding(padding: new EdgeInsets.only(top: 20.0),),
          new MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => index_tata_tertib() ));
            }, child: Text("Back To List"),
            color: Colors.orange,
            textColor: Colors.white,
          ),
        ]),
      ),
    );
  }
}
