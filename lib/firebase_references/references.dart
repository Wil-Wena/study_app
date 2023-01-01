import 'package:cloud_firestore/cloud_firestore.dart';

final fire = FirebaseFirestore.instance;
final questionPaperRef = fire.collection('questionPapers');
