import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final enableLogin = true.obs;
  final isChecked = true.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController emailC;
  late final TextEditingController passwordC;
  final count = 0.obs;
  @override
  void onInit() {
    emailC = TextEditingController(text: 'hakim@gmail.com');
    passwordC = TextEditingController(text: 'hakim123');
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

  void increment() => count.value++;
}
