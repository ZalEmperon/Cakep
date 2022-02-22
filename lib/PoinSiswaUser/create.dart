import 'package:cakapp/PoinSiswaUser/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class create extends StatefulWidget {
  create({Key? key}) : super(key: key);
  @override
  _createState createState() => _createState();
}

class _createState extends State<create> {
  final _formKey = GlobalKey<FormState>();

  final Stream<QuerySnapshot> tatatertibStream =
  FirebaseFirestore.instance.collection('tatatertib').snapshots();

  var nis = "";
  var nama = "";
  var kelas = "";
  var indikator = "";
  var poin = "10";

  late String _valIndikator;

  final indikatorController = TextEditingController();
  final namaController = TextEditingController();
  final nisController = TextEditingController();
  final kelasController = TextEditingController();
  final poinController = TextEditingController(text: "10");
  @override

  void dispose() {
    // Clean up the controller when the widget is disposed.
    indikatorController.dispose();
    nisController.dispose();
    namaController.dispose();
    kelasController.dispose();
    poinController.dispose();
    super.dispose();
  }

  clearText() {
    indikatorController.clear();
    nisController.clear();
    namaController.clear();
    kelasController.clear();
    poinController.clear();
  }

  // Adding Poin
  CollectionReference poinsiswa = FirebaseFirestore.instance.collection('poinsiswa');

  Future<void> addPoinSiswa() {
    return poinsiswa
        .add({'nis': nis, 'nama': nama, 'kelas': kelas,  'indikator': indikator,  'poin': poin})
        .then((value) => print('Poin Siswa Added'))
        .catchError((error) => print('Failed to Add Poin Siswa: $error'));
  }

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
          title: Text("Form Tambah Poin Siswa"),
        ),
        body: SingleChildScrollView(
          key: _formKey,
            child: Padding(
              padding: new EdgeInsets.all(10.0),
                child: new Column(
            children: <Widget> [
              new TextField(
                decoration: new InputDecoration(
                    hintText: "NIS",
                    labelText: "NIS",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
                controller: nisController,
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              new TextField(
                decoration: new InputDecoration(
                    hintText: "Nama",
                    labelText: "Nama",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
                controller: namaController,
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              new TextField(
                decoration: new InputDecoration(
                    hintText: "kelas",
                    labelText: "Kelas",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
                controller: kelasController,
              ),
              new Padding(padding: new EdgeInsets.only(top: 20.0),),

            DropdownSearch<String>(

              mode: Mode.MENU,
              showSelectedItems: true,
              items: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return data["indikator"];
              }).toList().cast<String>(),

              label: "Pilih Indikator",
              popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: (data) => setState((){ controller : indikatorController;}),


            ),

                // DropdownSearch<String>(
                // for (var i = 0; i < storedocs.length; i++)...[
                //   mode: Mode.MENU,
                //   showSelectedItems: true,
                //   items: [storedocs[i]['aspek']],
                //   label: "Aspek Indikator",
                //   hint: "Pilih Aspek Indikator",
                //   popupItemDisabled: (String s) => s.startsWith('I'),
                //   onChanged: print,
                //
                // ]),



              new Padding(padding: new EdgeInsets.only(top: 20.0),),
              new TextField(
                decoration: new InputDecoration(
                    hintText: "10",
                    labelText: "Poin",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),

                controller: TextEditingController(text: "10"),

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
                      onPressed: () {
                        setState(() {
                          indikator = indikatorController.text;
                          nama = namaController.text;
                          nis = nisController.text;
                          kelas = kelasController.text;
                          poin = poinController.text;
                          addPoinSiswa();
                          clearText();
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PoinSiswaUser()));
                        });
                      },
                    child: Text("Save"),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
            )
    )
    );
        },
    );
  }
}
