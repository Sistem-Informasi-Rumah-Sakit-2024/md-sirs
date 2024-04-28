import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sirs/app/controllers/firestore_controller.dart';
import 'package:sirs/app/modules/records/records/controllers/records_controller.dart';
import 'package:sirs/app/utils/constants.dart';

class RecordActionsController extends GetxController {
  final recordController = Get.find<RecordsController>();

  late TextEditingController recordNameController;
  late TextEditingController patientIndexController;
  late TextEditingController sexController;
  late TextEditingController ageController;
  late TextEditingController diagnosesController;
  late TextEditingController additionalNotesController;
  final selectedGender = ''.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firestoreC = Get.put(FirestoreController());

  //TODO: ACTION RECORD
  final pageType = PageType.TAMBAH.obs;
  final recordId = "".obs;

  void addRecord(
    String recordName,
    String patientIndex,
    String sex,
    int age,
    String? diagnoses,
    String? additional_notes,
  ) async {
    CollectionReference records = firestore.collection('records_data');

    try {
      await records.add({
        'record_name': recordName,
        'sex': sex,
        'age': age,
        'diagnoses': diagnoses,
        'patient_index': patientIndex,
        'additional_notes': additional_notes,
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        recordController.refreshData();
        Get.back();
        Get.showSnackbar(
          const GetSnackBar(
            shouldIconPulse: false,
            mainButton: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.check_box,
                color: Colors.white,
                size: 32,
              ),
            ),
            backgroundColor: Colors.green,
            title: 'Berhasil',
            message: 'Record berhasil ditambahkan',
            duration: Duration(seconds: 3),
          ),
        );
      });
    } catch (e) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.back();
        Get.showSnackbar(
          const GetSnackBar(
            shouldIconPulse: false,
            mainButton: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.check_box,
                color: Colors.white,
                size: 32,
              ),
            ),
            backgroundColor: Colors.red,
            title: 'Gagal',
            message: 'Terjadi kesalahan saat menambahkan data',
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
  }

  void saveRecord(
    String recordName,
    String patientIndex,
    String sex,
    int age,
    String? diagnoses,
    String? additional_notes,
  ) async {
    try {
      firestoreC.editRecord(
        recordId.value,
        {
          'record_name': recordName,
          'sex': sex,
          'age': age,
          'diagnoses': diagnoses,
          'patient_index': patientIndex,
          'additional_notes': additional_notes,
        },
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        recordController.refreshData();
        Get.back();
        Get.showSnackbar(
          const GetSnackBar(
            shouldIconPulse: false,
            mainButton: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.check_box,
                color: Colors.white,
                size: 32,
              ),
            ),
            backgroundColor: Colors.green,
            title: 'Berhasil',
            message: 'Record berhasil disimpan',
            duration: Duration(seconds: 3),
          ),
        );
      });
    } catch (e) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.back();
        Get.showSnackbar(
          const GetSnackBar(
            shouldIconPulse: false,
            mainButton: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.check_box,
                color: Colors.white,
                size: 32,
              ),
            ),
            backgroundColor: Colors.red,
            title: 'Gagal',
            message: 'Terjadi kesalahan saat menyimpan data',
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
  }

  initDetail() {
    final data = Get.arguments[0];
    recordNameController.text = data['recordName'];
    patientIndexController.text = data['patientName'];
    sexController.text = data['recordSex'] == 'F' ? 'Female' : 'Male';
    ageController.text = data['recordAge'].toString();
    diagnosesController.text =
        data['diagnoses'] == '' ? '-' : data['diagnoses'];
    additionalNotesController.text =
        data['additional_notes'] == '' ? '-' : data['additional_notes'];
  }

  @override
  void onInit() {
    pageType.value = Get.arguments[0]['pageType'];
    super.onInit();
    recordNameController = TextEditingController();
    patientIndexController = TextEditingController();
    sexController = TextEditingController();
    ageController = TextEditingController();
    diagnosesController = TextEditingController();
    additionalNotesController = TextEditingController();
    if (pageType.value == PageType.TAMBAH) {
    } else {
      recordId.value = Get.arguments[0]['recordId'];
      initDetail();
      selectedGender.value = Get.arguments[0]['recordSex'];
    }
  }

  @override
  void onClose() {
    recordNameController.dispose();
    patientIndexController.dispose();
    sexController.dispose();
    ageController.dispose();
    diagnosesController.dispose();
    additionalNotesController.dispose();
    super.onClose();
  }
}
