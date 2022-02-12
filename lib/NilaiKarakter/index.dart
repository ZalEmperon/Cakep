import 'package:flutter/material.dart';
import 'package:cakapp/shared/navbk.dart';

class nilai_karakter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nilai Karakter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("nilai karakter")
          ],
        ),
      ),
    );
  }
}