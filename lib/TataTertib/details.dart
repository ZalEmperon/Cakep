import 'package:cakapp/TataTertib/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class tata_tertib_detail extends StatefulWidget {
  late final String id;
  tata_tertib_detail({Key? key, required this.id}) : super(key: key);
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
                  padding: new EdgeInsets.only(top: 20.0),
                  child: Column(children: <Widget>[
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
                                    child: Text(
                                      "Indikator", textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.bold),),
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
                                        indikator,
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
                                    child: Text("Poin", textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(19),
                                    child: Text(poin, textAlign: TextAlign.center),
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
                                    child: Text("Aspek", textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.bold),),
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
                                        aspek,
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                    ),
                    new Padding(padding: new EdgeInsets.only(top: 20.0),),
                    new MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => index_tata_tertib()));
                      }, child: Text("Back To List"),
                      color: Colors.orange,
                      textColor: Colors.white,
                    ),
                  ]),
                );
              })
      ),
    );
  }
}