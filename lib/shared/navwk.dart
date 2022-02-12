import 'package:cakapp/Pengumuman/index.dart';
import 'package:cakapp/PoinSiswa/index.dart';
import 'package:cakapp/NilaiKarakter/index.dart';
import 'package:cakapp/WaliKelas/indexwalas.dart';
import 'package:cakapp/DataSiswa/indexsiswa.dart';
import 'package:cakapp/WaliKelas/walas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cakapp/main.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void showAlertDialog() {
    showDialog(
        builder: (context) => new AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Anda yakin ingin keluar?"),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                onPressed: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.signOut().then((res) {
                    Navigator.pop(context);
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        MyApp()), (Route<dynamic> route) => false);
                  });
                }),
          ],
        ),
      context: context);
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Tampilan(snapshot.data!);
          }
          return CircularProgressIndicator();
        });
  }
  Tampilan(DocumentSnapshot snapshot){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/eevee.png'),
                radius: 40,
              ),
              accountName: Text(snapshot.get('username')),
              accountEmail:Text(snapshot.get('email')) ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Walas() ));
            },
          ),
          ListTile(
            leading: Icon(Icons.article_outlined),
            title: Text('Pengumuman'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => pengumuman() ));
            },
          ),
          ListTile(
            leading: Icon(Icons.control_point),
            title: Text('Poin Siswa'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => poin_siswa() ));
            },
          ),
          ListTile(
            leading: Icon(Icons.score),
            title: Text('Print Kelas'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => nilai_karakter() ));
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Walikelas'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => wali_kelas() ));
            },
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text('Data Siswa'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => data_siswa() ));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              showAlertDialog();
            },
          ),
        ],
      ),
    );
  }
}