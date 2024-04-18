import 'package:get/get.dart';

import '../controllers/record_actions_controller.dart';

class RecordActionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordActionsController>(
      () => RecordActionsController(),
    );
  }
}
