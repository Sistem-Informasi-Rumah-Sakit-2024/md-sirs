import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sirs/app/controllers/auth_controller.dart';
import 'package:sirs/app/controllers/firestore_controller.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sirs/app/routes/app_pages.dart';
import 'package:sirs/app/utils/constants.dart';
import 'package:sirs/app/utils/popup.dart';

class HomeController extends GetxController {
  final firestoreC = Get.put(FirestoreController(), permanent: true);
  final authC = Get.find<AuthController>();

  //TODO: Implement HomeController
  final totalRecord = 0.obs;
  final totalMale = 0.obs;
  final totalFemale = 0.obs;
  final totalPasient = 0.obs;

  void fetchTotalRecords() async {
    totalRecord.value = await firestoreC.totalRecords();
    totalMale.value = await firestoreC.totalRecordsMale();
    totalFemale.value = await firestoreC.totalRecordsFemale();
    totalPasient.value = await firestoreC.uniquePatientIndexCount();
  }

  void logout() {
    PanaraConfirmDialog.show(
      Get.context!,
      title: "Konfirmasi",
      message: "Apakah anda yakin untuk keluar akun?",
      confirmButtonText: "Tidak",
      cancelButtonText: "Ya",
      onTapCancel: () {
        authC.logout();
      },
      onTapConfirm: () {
        Navigator.pop(Get.context!);
      },
      panaraDialogType: PanaraDialogType.custom,
      color: kPrimaryblue500,
      buttonTextColor: Colors.white,
      barrierDismissible: false,
    );
  }

  @override
  void onInit() {
    fetchTotalRecords();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
