import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordActionsController extends GetxController {
  late TextEditingController recordNameController;
  late TextEditingController patientIndexController;
  late TextEditingController sexController;
  late TextEditingController ageController;
  late TextEditingController diagnosesController;
  late TextEditingController additionalNotesController;
  final selectedGender = ''.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        'name': recordName,
        'sex': sex,
        'age': age,
        'diagnoses': diagnoses,
        'patientIndex': patientIndex,
        'additional_notes': additional_notes,
      });
      Get.defaultDialog(
        title: 'Success',
        middleText: 'Record added successfully',
        onConfirm: () => Get.back(),
        textConfirm: 'OK',
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'An error occurred',
        onConfirm: () => Get.back(),
        textConfirm: 'OK',
      );
    }
  }

  @override
  void onInit() {
    recordNameController = TextEditingController();
    patientIndexController = TextEditingController();
    sexController = TextEditingController();
    ageController = TextEditingController();
    diagnosesController = TextEditingController();
    additionalNotesController = TextEditingController();
    super.onInit();
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
