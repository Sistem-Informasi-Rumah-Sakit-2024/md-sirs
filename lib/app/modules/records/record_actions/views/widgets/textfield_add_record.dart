import 'package:flutter/material.dart';
import 'package:sirs/app/modules/records/record_actions/controllers/record_actions_controller.dart';
import 'package:sirs/app/utils/constants.dart';

class TextFieldInputRecord extends StatelessWidget {
  const TextFieldInputRecord({
    super.key,
    required this.controller,
    required this.textController,
    required this.keyboardType,
    required this.title,
    required this.textInputAction,
    required this.enabled,
    this.maxLines,
  });

  final RecordActionsController controller;
  final String title;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enabled;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: controller.pageType.value == PageType.DETAIL
          ? TextAlign.center
          : TextAlign.start,
      enabled: enabled,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: textController,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        floatingLabelAlignment: controller.pageType.value == PageType.DETAIL
            ? FloatingLabelAlignment.center
            : FloatingLabelAlignment.start,
        border: OutlineInputBorder(),
        labelText: title,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      maxLines: maxLines,
    );
  }
}
