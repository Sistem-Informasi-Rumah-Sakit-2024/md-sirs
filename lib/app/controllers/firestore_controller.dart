import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseFirestore.instance
  // .collection('scores')
  // .orderBy('score', descending: true)
  Query<Object?> query = FirebaseFirestore.instance
      .collection('records_data')
      .orderBy('age', descending: false);

  Query queryByFemale = FirebaseFirestore.instance
      .collection('records_data')
      .where('sex', isEqualTo: 'F')
      .orderBy('age', descending: false)
      .orderBy(FieldPath.documentId, descending: true);

  Query queryByMale = FirebaseFirestore.instance
      .collection('records_data')
      .where('sex', isEqualTo: 'M')
      .orderBy('age', descending: false)
      .orderBy(FieldPath.documentId, descending: true);
}
