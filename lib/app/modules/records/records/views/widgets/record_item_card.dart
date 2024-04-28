import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sirs/app/modules/records/records/controllers/records_controller.dart';
import 'package:sirs/app/utils/constants.dart';

class RecordCardItem extends GetWidget<RecordsController> {
  const RecordCardItem({
    super.key,
    required this.recordName,
    required this.recordAge,
    required this.recordIndex,
    required this.patientName,
    required this.recordSex,
    required this.docIdAction,
    required this.body,
    this.onDoubleTap,
  });

  final String recordName;
  final int recordAge;
  final int recordIndex;
  final String patientName;
  final String recordSex;
  final String docIdAction;
  final void Function()? onDoubleTap;
  final Map<String, dynamic> body;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDoubleTap,
      child: Card(
        color: kPrimaryDark200,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: kPrimaryDark300,
            radius: 24,
            child: Icon(
              recordSex == "M" ? Icons.man_outlined : Icons.woman_outlined,
              size: 40,
              color: Colors.white,
            ),
          ),
          title: Text(
            recordName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '$recordAge years old',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: PopupMenuButton<String>(
            iconColor: Colors.white,
            onSelected: (String item) {
              controller.menuClicked(item, docIdAction, body);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Edit',
                child: Text('Edit'),
              ),
              const PopupMenuItem<String>(
                value: 'Hapus',
                child: Text('Hapus'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
