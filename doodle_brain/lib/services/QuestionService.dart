import 'dart:convert';

import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/models/question_model.dart';
import 'package:flutter/services.dart';

class Questionservice {

static final Questionservice _instance =  Questionservice._internal();
  factory Questionservice() => _instance;

  Questionservice._internal();


  Future<List<Question>> loadQuestions({required Topic topic ,required Difficulty difficulty}) async {
    final jsonString = await rootBundle.loadString('lib/assets/data/questions/${topic.name}/${difficulty.name}.json');
    final List decoded = json.decode(jsonString);
    return decoded.map((question) => Question.fromJson(question)).toList();
  }

}