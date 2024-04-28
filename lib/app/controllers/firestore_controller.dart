import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //TODO EDIT RECORD
  void editRecord(String recordId, Map<String, dynamic> dataToUpdate) {
    firestore
        .collection("records_data")
        .doc(recordId)
        .update(dataToUpdate)
        .then((_) {})
        .catchError((error) {
      Get.showSnackbar(GetBar(
        message: "Failed to update record: $error",
        duration: const Duration(seconds: 3),
      ));
    });
  }

  //TODO: DELETE RECORD
  Future<void> deleteDocument(String recordId) async {
    try {
      await FirebaseFirestore.instance
          .collection("records_data")
          .doc(recordId)
          .delete();
      print("Document deleted successfully!");
    } catch (e) {
      print("Error deleting document: $e");
      // Handle specific exceptions if needed
    }
  }

  //TODO: Get length records_data
  Future<int> uniquePatientIndexCount() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('records_data').get();

    // Create an empty set to store unique patient_index values
    Set<String> patientIndexSet = Set<String>();

    // Loop through the documents and add each "patient_index" value to the set
    snapshot.docs.forEach((doc) {
      patientIndexSet.add(doc['patient_index']);
    });

    // Return the size of the set, which represents the number of unique patient_index values

    return patientIndexSet.length;
  }

  Future<int> totalRecords() async {
    QuerySnapshot snapshot = await firestore.collection('records_data').get();
    return snapshot.docs.length;
  }

  Future<int> totalRecordsMale() async {
    QuerySnapshot snapshot = await firestore
        .collection('records_data')
        .where('sex', isEqualTo: 'M')
        .get();
    return snapshot.docs.length;
  }

  Future<int> totalRecordsFemale() async {
    QuerySnapshot snapshot = await firestore
        .collection('records_data')
        .where('sex', isEqualTo: 'F')
        .get();
    return snapshot.docs.length;
  }

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
