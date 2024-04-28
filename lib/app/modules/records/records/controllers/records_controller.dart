import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sirs/app/controllers/firestore_controller.dart';
import 'package:sirs/app/routes/app_pages.dart';
import 'package:sirs/app/utils/constants.dart';

class RecordsController extends GetxController {
  final firestoreC = Get.put(FirestoreController());
  final List<dynamic> dataRecords = [];
  final isDone = false.obs;
  final isLoadData = false.obs;

  void menuClicked(String menu, String recordId, Map<String, dynamic> body) {
    if (menu == 'Edit') {
      Get.toNamed(
        Routes.RECORD_ACTIONS,
        arguments: [body],
      );
    } else {
      deleteRecord(recordId);
    }
  }

  deleteRecord(String recordId) {
    PanaraConfirmDialog.show(
      Get.context!,
      title: "Konfirmasi",
      message: "Yakin ingin menghapus Record?",
      confirmButtonText: "Tidak",
      cancelButtonText: "Ya",
      onTapCancel: () async {
        await firestoreC.deleteDocument(recordId);
        Get.back();
        refreshData();
      },
      onTapConfirm: () {
        Get.back();
      },
      panaraDialogType: PanaraDialogType.custom,
      color: kPrimaryDark300,
      buttonTextColor: Colors.white,
      textColor: kPrimaryDark100,
      barrierDismissible: false,
    );
  }

  initRecordList() async {
    try {
      isDone.value = false;
      final snapshot = await firestoreC.firestore
          .collection('records_data')
          .orderBy('age', descending: false)
          .get();
      final temp =
          snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();

      if (dataRecords.isNotEmpty) {
        dataRecords.clear();
      }
      dataRecords.addAll(temp);
      await Future.delayed(Duration(milliseconds: 400));
      isDone.value = true;
    } catch (e) {
      print(e.toString());
    }
  }

  Future refreshData() async {
    initRecordList();
  }

  @override
  void onInit() {
    super.onInit();
    initRecordList();
  }
}
