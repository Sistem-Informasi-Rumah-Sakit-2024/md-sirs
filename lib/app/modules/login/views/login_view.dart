import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sirs/app/controllers/auth_controller.dart';
import 'package:sirs/app/utils/constants.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDark200,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                color: kPrimaryDark200,
              ),
              child: Text(
                'PAPA',
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => ElevatedButton(
                              onPressed: () {
                                controller.enableLogin.value = true;
                              },
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                  Size(MediaQuery.of(context).size.width * 0.4,
                                      48),
                                ),
                                side: MaterialStateProperty.all(
                                  BorderSide(
                                    color: controller.enableLogin.value
                                        ? kPrimaryblue500
                                        : Colors.transparent,
                                    width: 0.7,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: controller.enableLogin.value
                                      ? kPrimaryblue500
                                      : Colors.grey,
                                  fontWeight: controller.enableLogin.value
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            )),
                        const SizedBox(width: 20),
                        Obx(() => ElevatedButton(
                              onPressed: () {
                                controller.enableLogin.value = false;
                              },
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                  Size(MediaQuery.of(context).size.width * 0.4,
                                      48),
                                ),
                                side: MaterialStateProperty.all(
                                  BorderSide(
                                    color: !controller.enableLogin.value
                                        ? kPrimaryblue500
                                        : Colors.transparent,
                                    width: 0.7,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: !controller.enableLogin.value
                                      ? kPrimaryblue500
                                      : Colors.grey,
                                  fontWeight: !controller.enableLogin.value
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.emailC,
                      decoration: const InputDecoration(
                        // labelText: 'E-mail ID',
                        hintText: 'E-mail ID',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: kPrimaryblue500,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryblue500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.passwordC,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: kPrimaryblue500,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryblue500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.isChecked.value,
                            checkColor: kPrimaryDark300,
                            activeColor: Colors.white,
                            // activeColor: kPrimaryDark300,
                            onChanged: (_) {
                              controller.isChecked.value =
                                  !controller.isChecked.value;
                            },
                          ),
                        ),
                        const Text('Remember me'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: kPrimaryblue500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => authC.login(
                          controller.emailC.text.trim(),
                          controller.passwordC.text.trim()),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 56),
                        // backgroundColor: kPrimaryDark300,
                        backgroundColor: kPrimaryDark300,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
