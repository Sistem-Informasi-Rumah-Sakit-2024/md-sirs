import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sirs/app/controllers/firestore_controller.dart';
import 'package:sirs/app/routes/app_pages.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import '../controllers/records_controller.dart';

class RecordsView extends GetView<RecordsController> {
  RecordsView({Key? key}) : super(key: key);
  final firestoreC = Get.put(FirestoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecordsView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.RECORD_ACTIONS),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FirestorePagination(
        limit: 10, // Defaults to 10.
        viewType: ViewType.list,
        bottomLoader: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.blue,
          ),
        ),
        query: firestoreC.queryByFemale,
        itemBuilder: (context, documentSnapshot, index) {
          final data = documentSnapshot.data() as Map<String, dynamic>?;
          if (data == null) return Container();

          return ListTile(
            title: Text(data['patient_index'] ?? 'No name'),
            subtitle:
                Text('${data['age'].toString()} years old - ${data['sex']}'),
          );
        },
      ),
    );
  }
}
