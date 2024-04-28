import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sirs/app/modules/records/records/views/widgets/record_item_card.dart';
import 'package:sirs/app/routes/app_pages.dart';
import 'package:sirs/app/utils/constants.dart';
import '../controllers/records_controller.dart';

class RecordsView extends GetView<RecordsController> {
  RecordsView({Key? key}) : super(key: key);
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: const Text(
                      'Records',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Row(
                    children: [
                      SearchAnchor(
                        builder: (context, SearchController controller) {
                          return const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 32,
                          );
                        },
                        suggestionsBuilder: (context, query) {
                          return [];
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.RECORD_ACTIONS,
                            arguments: [
                              {
                                'pageType': PageType.TAMBAH,
                              },
                            ],
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // body: RefreshIndicator(
      //   onRefresh: controller.refreshData,
      //   child: FirestorePagination(
      //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      //     limit: 4, // Defaults to 10.
      //     shrinkWrap: true,
      //     viewType: ViewType.list,
      //     initialLoader: const Center(
      //       child: CircularProgressIndicator(),
      //     ),
      //     separatorBuilder: (context, index) => const SizedBox(height: 4),
      //     bottomLoader: const Center(
      //       child: CircularProgressIndicator(
      //         strokeWidth: 4,
      //         color: kPrimaryblue500,
      //       ),
      //     ),
      //     query: controller.firestoreC.query,
      //     itemBuilder: (context, documentSnapshot, index) {
      //       final data = documentSnapshot.data() as Map<String, dynamic>?;
      //       final docId = documentSnapshot.id;
      //       if (data == null) return Container();
      //       return RecordCardItem(
      //         onDoubleTap: () {
      //           debugPrint(docId);
      //           Get.toNamed(
      //             Routes.RECORD_ACTIONS,
      //             arguments: [
      //               {
      //                 'pageType': PageType.DETAIL,
      //                 'recordName': data['record_name'],
      //                 'recordAge': data['age'],
      //                 'recordSex': data['sex'],
      //                 'patientName': data['patient_index'],
      //                 'diagnoses': data['diagnoses'],
      //                 'additional_notes': data['additional_notes'],
      //                 'recordId': docId,
      //               },
      //             ],
      //           );
      //         },
      //         recordName: data['record_name'],
      //         recordAge: data['age'],
      //         recordSex: data['sex'],
      //         recordIndex: index,
      //         patientName: data['patient_index'],
      //         docIdAction: docId,
      //         body: {
      //           'pageType': PageType.EDIT,
      //           'recordName': data['record_name'],
      //           'recordAge': data['age'],
      //           'recordSex': data['sex'],
      //           'patientName': data['patient_index'],
      //           'diagnoses': data['diagnoses'],
      //           'additional_notes': data['additional_notes'],
      //           'recordId': docId,
      //         },
      //       );
      //     },
      //   ),
      // ),

      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: SafeArea(
          child: Obx(
            () => controller.isDone.value
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.dataRecords.isNotEmpty
                        ? (controller.dataRecords.length +
                            (controller.isLoadData.value ? 1 : 0))
                        : 0,
                    itemBuilder: (context, index) {
                      if (index < controller.dataRecords.length) {
                        final data = controller.dataRecords[index];

                        return RecordCardItem(
                          onDoubleTap: () {
                            debugPrint(data['id']);
                            Get.toNamed(
                              Routes.RECORD_ACTIONS,
                              arguments: [
                                {
                                  'pageType': PageType.DETAIL,
                                  'recordName': data['record_name'],
                                  'recordAge': data['age'],
                                  'recordSex': data['sex'],
                                  'patientName': data['patient_index'],
                                  'diagnoses': data['diagnoses'],
                                  'additional_notes': data['additional_notes'],
                                  'recordId': data['id'],
                                },
                              ],
                            );
                          },
                          recordName: data['record_name'],
                          recordAge: data['age'],
                          recordSex: data['sex'],
                          recordIndex: index,
                          patientName: data['patient_index'],
                          docIdAction: data['id'],
                          body: {
                            'pageType': PageType.EDIT,
                            'recordName': data['record_name'],
                            'recordAge': data['age'],
                            'recordSex': data['sex'],
                            'patientName': data['patient_index'],
                            'diagnoses': data['diagnoses'],
                            'additional_notes': data['additional_notes'],
                            'recordId': data['id'],
                          },
                        );
                      } else {
                        return controller.isLoadData.value
                            ? Shimmer.fromColors(
                                baseColor: kPrimaryDark200,
                                highlightColor: kPrimaryDark300,
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Card(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 64,
                                    ),
                                  ),
                                ),
                              )
                            : Container(); // R
                      }
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, snapshot) {
                      return Shimmer.fromColors(
                        baseColor: kPrimaryDark200,
                        highlightColor: kPrimaryDark300,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Card(
                            child: SizedBox(
                              width: double.infinity,
                              height: 64,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),

      // body: Center(
      //   child: ElevatedButton(
      //     child: Text('PRESS'),
      //     onPressed: () => controller.test(),
      //   ),
      // ),
    );
  }
}
