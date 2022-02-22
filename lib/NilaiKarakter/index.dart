import 'package:flutter/material.dart';
import 'package:cakapp/shared/navbk.dart';

class nilai_karakter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nilai Karakter"),
      ),
      drawer: NavBar(),
      body:  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Text("DATA NILAI KARAKTER SISWA"),
            ),
            Container(
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
                      DataColumn(label: Text("NIS")),
                      DataColumn(label: Text("Nama")),
                      DataColumn(label: Text("Kelas")),
                      DataColumn(label: Text("Beriman, Bertaqwa Kepada Tuhan YME, dan Berakhlak Mulia")),
                      DataColumn(label: Text("Berkebhinekaan Global")),
                      DataColumn(label: Text("Gotong Royong")),
                      DataColumn(label: Text("Kreatif")),
                      DataColumn(label: Text("Bernalar Kritis")),
                      DataColumn(label: Text("Mandiri")),
                      DataColumn(label: Text("Action"))
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("3103119151")),
                          DataCell(Text("Ragil Putri rahmadani")),
                          DataCell(Text("XII RPL 5")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(IconButton(
                            icon: Icon(Icons.print_rounded),
                            color: Colors.grey,
                            tooltip: 'print',
                            onPressed: () {},
                          ),),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("3103119151")),
                          DataCell(Text("Ragil Putri rahmadani")),
                          DataCell(Text("XII RPL 5")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(IconButton(
                            icon: Icon(Icons.print_rounded),
                            color: Colors.grey,
                            tooltip: 'print',
                            onPressed: () {},
                          ),),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("3103119151")),
                          DataCell(Text("Ragil Putri rahmadani")),
                          DataCell(Text("XII RPL 5")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(Text("10")),
                          DataCell(IconButton(
                            icon: Icon(Icons.print_rounded),
                            color: Colors.grey,
                            tooltip: 'print',
                            onPressed: () {},
                          ),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}