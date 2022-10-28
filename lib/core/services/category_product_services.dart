import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProductServices {
  final CollectionReference _manCategoryCollectionRef =
      FirebaseFirestore.instance.collection('Man');
  final CollectionReference _womanCategoryCollectionRef =
      FirebaseFirestore.instance.collection('Woman');
  final CollectionReference _gadgetsCategoryCollectionRef =
      FirebaseFirestore.instance.collection('Gadgets');
  final CollectionReference _gamingCategoryCollectionRef =
      FirebaseFirestore.instance.collection('Gaming');

  Future<List<QueryDocumentSnapshot>> getManCategory() async {
    var value = await _manCategoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getWomanCategory() async {
    var value = await _womanCategoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getGadgetsCategory() async {
    var value = await _gadgetsCategoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getGamingCategory() async {
    var value = await _gamingCategoryCollectionRef.get();
    return value.docs;
  }
}
