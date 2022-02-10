import 'package:flutter/material.dart';
import 'package:cakapp/shared/navsiswa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Siswa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Image.asset(
            'assets/images/telkomsch2.png',
            width: 90,
            height: 90,
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Tampilan(snapshot.data!);
              }
              return CircularProgressIndicator();
            }));
  }
  Tampilan(DocumentSnapshot snapshot){
    return Center(
        child: Text('Selamat Datang Siswa Telkom '+snapshot.get('nama')),
    );
  }
}
