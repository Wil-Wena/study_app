import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/question_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    final firestore = FirebaseFirestore.instance;

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

    List<QuestionModel> questionsPapers = [];
    //Looping through the json data
    for (var paper in papersAssets) {
      String m = await rootBundle.loadString(paper);
      // print(m);
      questionsPapers.add(QuestionModel.fromJson(json.decode(m)));
    }
    // print('${questionsPapers[0].description}');
    var batch = firestore.batch();
  }
}
