import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/data_uploader.dart';
import 'package:study_app/firebase_references/firebase_loading_status.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});

  //Data Uploader Class Injected.
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(
        (() => Text(
              controller.loadingStatus.value == LoadingStatus.completed
                  ? "Uploading Completed"
                  : "Uploading...",
            )),
      ),
    ));
  }
}
