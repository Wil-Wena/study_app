import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_app/firebase_references/firebase_loading_status.dart';
import 'package:study_app/firebase_references/references.dart';

import '../../models/question_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus =
      LoadingStatus.loading.obs; //LoadingStatus made observable

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;

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
     * Data collections uploaded and 
     * fields specifyed for each JSON file in assets DB.
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

      //Specifying fields for question collections
      for (var questions in paper.questions!) {
        final questionPath =
            questionRef(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });

        for (var answer in questions.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifier),
              {"identifier": answer.identifier, "answer": answer.answer});
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
