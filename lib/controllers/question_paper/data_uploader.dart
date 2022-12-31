import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
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
    for (var paper in papersAssets) {
      String m = await rootBundle.loadString(paper);
      print(m);
    }
  }
}
