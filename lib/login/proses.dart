import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cakapp/WaliKelas/walas.dart';
import 'package:cakapp/DataSiswa/siswa.dart';
import 'package:cakapp/GuruBK/bk.dart';
import 'package:flutter/material.dart';
import 'package:cakapp/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String role = 'siswa';

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      role = snap['role'];
    });

    if (role == 'siswa') {
      navigateNext(Siswa());
    } else if (role == 'guru') {
      navigateNext(Walas());
    } else if (role == 'bk') {
      navigateNext(guru_bk());
    }
  }

  void navigateNext(Widget route) {
    Timer(Duration(milliseconds: 0), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => route));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
