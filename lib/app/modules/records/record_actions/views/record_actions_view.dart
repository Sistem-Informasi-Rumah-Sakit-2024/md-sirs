import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:sirs/app/utils/constants.dart';

import '../controllers/record_actions_controller.dart';

class RecordActionsView extends GetView<RecordActionsController> {
  const RecordActionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDark100,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: Column(
          children: [
            Container(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 56,
              color: kPrimaryDark200,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Record Actions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldInputRecord(
                controller: controller,
                textController: controller.recordNameController,
                keyboardType: TextInputType.text,
                title: 'Record Name',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              TextFieldInputRecord(
                controller: controller,
                textController: controller.patientIndexController,
                keyboardType: TextInputType.text,
                title: 'Patient Name',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 14),
                    const Text('Gender  ',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Radio(
                      activeColor: kPrimaryblue500,
                      value: 'M',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        controller.selectedGender.value = value as String;
                      },
                    ),
                    Text('Male', style: TextStyle(color: Colors.white)),
                    const SizedBox(width: 10),
                    Radio(
                      activeColor: kPrimaryblue500,
                      value: 'F',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        controller.selectedGender.value = value as String;
                      },
                    ),
                    Text('Female', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextFieldInputRecord(
                controller: controller,
                textController: controller.ageController,
                keyboardType: TextInputType.number,
                title: 'Age',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              TextFieldInputRecord(
                controller: controller,
                textController: controller.diagnosesController,
                keyboardType: TextInputType.text,
                title: 'Diagnoses',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              TextFieldInputRecord(
                controller: controller,
                textController: controller.additionalNotesController,
                keyboardType: TextInputType.text,
                title: 'Additional Notes',
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.addRecord(
                    controller.recordNameController.text,
                    controller.patientIndexController.text,
                    controller.selectedGender.value,
                    int.parse(controller.ageController.text),
                    controller.diagnosesController.text,
                    controller.additionalNotesController.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryblue500,
                  fixedSize: Size(MediaQuery.of(context).size.width, 48),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Add Record',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldInputRecord extends StatelessWidget {
  const TextFieldInputRecord({
    super.key,
    required this.controller,
    required this.textController,
    required this.keyboardType,
    required this.title,
    required this.textInputAction,
  });

  final RecordActionsController controller;
  final String title;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      controller: textController,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: title,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
