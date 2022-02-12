import 'package:cakapp/TataTertib/model.dart';
import 'package:flutter/material.dart';
import 'package:cakapp/TataTertib/firestore_service.dart';
import 'package:uuid/uuid.dart';

class tata_tertib_provider with ChangeNotifier{
  final firestoreService = FirestoreService();
  late String _id;
  late String _indikator;
  late String _poin;
  late String _aspek;
  var uuid = Uuid();

  //getter
  String get indikator => _indikator;
  String get poin => _poin;
  String get aspek => _aspek;

  //setter
  changeIndikator(String value){
    _indikator=value;
    notifyListeners();
  }

  changePoin(String value){
    _poin=value;
    notifyListeners();
  }

  changeAspek(String value){
    _aspek=value;
    notifyListeners();
  }

  saveTataTertib(){
    var newIndikator = tata_tertib(indikator: indikator, poin: poin, aspek: aspek, id: uuid.v4());
    firestoreService.saveTataTertib(newIndikator);
  }

}