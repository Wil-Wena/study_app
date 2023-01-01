import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_app/firebase_references/references.dart';

import '../../models/question_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    final fire = FirebaseFirestore.instance;

    //Fetches data from assets folder & decodes it.
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    //load json files
    final papersAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") &&
            path.contains(".json")) // Ensuring data fetched is json format
        .toList();

    List<QuestionModel> questionPapers = [];
    //Looping through the json data
    for (var paper in papersAssets) {
      String m = await rootBundle.loadString(paper);
      // print(m);
      questionPapers.add(QuestionModel.fromJson(json.decode(m)));
    }
    // print('${questionPapers[0].description}');
    var batch = fire.batch();

    /**Creating collections on Firebase
     * Database being uploaded to Firebase
     * */
    for (var paper in questionPapers) {
      batch.set(questionPaperRef.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null
            ? 0
            : paper.questions!.length //Questions can be nullable.
      });
    }
    await batch.commit();
  }
}
