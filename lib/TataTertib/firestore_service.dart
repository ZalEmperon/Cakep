import 'package:cakapp/TataTertib/model.dart';
import 'package:cakapp/TataTertib/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveTataTertib(tata_tertib t_tertib){
   return _db.collection('tatatertib').doc(t_tertib.id).set(t_tertib.toMap());
  }

}