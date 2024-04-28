import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:sirs/app/modules/records/record_actions/views/widgets/textfield_add_record.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    '${controller.pageType.value == PageType.DETAIL ? 'Detail' : controller.pageType.value == PageType.TAMBAH ? 'Tambah' : 'Edit'} Record',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 30),
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
                enabled:
                    controller.pageType.value != PageType.DETAIL ? true : false,
                controller: controller,
                textController: controller.recordNameController,
                keyboardType: TextInputType.text,
                title: 'Record Name',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              TextFieldInputRecord(
                enabled:
                    controller.pageType.value != PageType.DETAIL ? true : false,
                controller: controller,
                textController: controller.patientIndexController,
                keyboardType: TextInputType.text,
                title: 'Patient Name',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              controller.pageType.value != PageType.DETAIL
                  ? Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 14),
                          const Text('Gender  ',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          Radio(
                            activeColor: kPrimaryblue500,
                            value: 'M',
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.selectedGender.value = value as String;
                            },
                          ),
                          const Text('Male',
                              style: TextStyle(color: Colors.white)),
                          const SizedBox(width: 10),
                          Radio(
                            activeColor: kPrimaryblue500,
                            value: 'F',
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.selectedGender.value = value as String;
                            },
                          ),
                          const Text('Female',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  : TextField(
                      enabled: false,
                      textAlign: TextAlign.center,
                      controller: controller.sexController,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        border: OutlineInputBorder(),
                        labelText: 'Gender',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
              const SizedBox(height: 10),
              TextFieldInputRecord(
                enabled:
                    controller.pageType.value != PageType.DETAIL ? true : false,
                controller: controller,
                textController: controller.ageController,
                keyboardType: TextInputType.number,
                title: 'Age',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              TextFieldInputRecord(
                enabled:
                    controller.pageType.value != PageType.DETAIL ? true : false,
                controller: controller,
                textController: controller.diagnosesController,
                keyboardType: TextInputType.text,
                title: 'Diagnoses',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              TextFieldInputRecord(
                enabled:
                    controller.pageType.value != PageType.DETAIL ? true : false,
                controller: controller,
                textController: controller.additionalNotesController,
                keyboardType: TextInputType.text,
                title: 'Additional Notes',
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 60),
              controller.pageType.value == PageType.TAMBAH
                  ? ElevatedButton(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        'Add Record',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : controller.pageType.value == PageType.EDIT
                      ? ElevatedButton(
                          onPressed: () {
                            controller.saveRecord(
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
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 48),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          child: const Text(
                            'Save Record',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
