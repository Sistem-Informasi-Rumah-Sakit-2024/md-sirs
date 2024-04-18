import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:sirs/app/controllers/auth_controller.dart';
import 'package:sirs/app/routes/app_pages.dart';
import 'package:sirs/app/utils/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
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
                  Icon(Icons.space_dashboard_outlined,
                      size: 36, color: Colors.white),
                  const SizedBox(width: 20),
                  Text(
                    'John Doe',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => authC.logout(),
                    icon: const Icon(
                      Icons.exit_to_app_rounded,
                      size: 36,
                    ),
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kPrimaryDark200,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Medical Record Statitic',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.RECORDS),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: kPrimaryDark300,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            width: 140,
                            height: 115,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Record',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  '25',
                                  style: TextStyle(
                                      fontSize: 48, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: kPrimaryblue500,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            height: 115,
                            width: 30,
                            child: const Center(
                              child: Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Colors.white,
                                size: 32,
                                weight: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: kPrimaryDark300,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          width: 140,
                          height: 115,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Patient',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                '25',
                                style: TextStyle(
                                    fontSize: 48, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: kPrimaryblue500,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          height: 115,
                          width: 30,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Colors.white,
                              size: 32,
                              weight: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: kPrimaryDark300,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          width: 140,
                          height: 115,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                '25',
                                style: TextStyle(
                                    fontSize: 48, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: kPrimaryblue500,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          height: 115,
                          width: 30,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Colors.white,
                              size: 32,
                              weight: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: kPrimaryDark300,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          width: 140,
                          height: 115,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                '25',
                                style: TextStyle(
                                    fontSize: 48, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: kPrimaryblue500,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          height: 115,
                          width: 30,
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Colors.white,
                              size: 32,
                              weight: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
