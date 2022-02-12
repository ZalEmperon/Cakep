import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TambahWaliKelas extends StatefulWidget {
  TambahWaliKelas({Key? key}) : super(key: key);

  @override
  _TambahWaliKelasState createState() => _TambahWaliKelasState();
}

class _TambahWaliKelasState extends State<TambahWaliKelas> {

  final _formKey = GlobalKey<FormState>();

  var username = "";
  var namawalikelas = "";
  var password = "";
  var kelas = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameController = TextEditingController();
  final namawalikelasController = TextEditingController();
  final passwordController = TextEditingController();
  final kelasController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    namawalikelasController.dispose();
    passwordController.dispose();
    kelasController.dispose();
    super.dispose();
  }

  clearText() {
    usernameController.clear();
    namawalikelasController.clear();
    passwordController.clear();
    kelasController.clear();
  }

  // Adding walas
  CollectionReference walikelas =
  FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return walikelas
        .add({'username': username, 'namawalikelas': namawalikelas, 'password': password, 'kelas': kelas, 'role':'guru'})
        .then((value) => print('Wali Kelas Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Wali Kelas"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Username: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Nama Wali Kelas: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: namawalikelasController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Nama Wali Kelas';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Kelas: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: kelasController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Kelas';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            username = usernameController.text;
                            namawalikelas = namawalikelasController.text;
                            password = passwordController.text;
                            kelas = kelasController.text;
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Tambah',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
