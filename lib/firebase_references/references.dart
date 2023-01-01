import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final fire = FirebaseFirestore.instance;
final questionPaperRef = fire.collection('questionPapers');

DocumentReference questionRef({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRef.doc(paperId).collection("questions").doc(questionId);
