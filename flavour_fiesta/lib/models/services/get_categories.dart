import 'package:cloud_firestore/cloud_firestore.dart';


class GetAllCategories {

  final Stream<QuerySnapshot> Dbcategories = FirebaseFirestore.instance.collection('Category').snapshots();


}
