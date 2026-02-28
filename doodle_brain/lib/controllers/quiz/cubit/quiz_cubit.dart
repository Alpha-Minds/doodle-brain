import 'dart:convert';

import 'package:doodle_brain/models/enums.dart';
import 'package:doodle_brain/models/levelProgress.dart';
import 'package:doodle_brain/models/question_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState(progress: {}));

  final Box _box = Hive.box('quizProgress');
  final Map<String, List<Question>> _cache = {};

  Future<List<Question>> _loadQuestions(
    Topic topic,
    Difficulty difficulty,
  ) async {
    final fileName = 'assets/questions/${topic.name}_${difficulty.name}.json';

    if (_cache.containsKey(fileName)) return _cache[fileName]!;

    final jsonString = await rootBundle.loadString(fileName);
    final List decoded = jsonDecode(jsonString);
    final questions = decoded
        .map((e) => Question.fromJson(e))
        .toList(growable: false);

    _cache[fileName] = questions;
    return questions;
  }

  Future<void> selectLevel(Topic topic, Difficulty difficulty) async {
    emit(state.copyWith(isLoading: true));

    final question = await _loadQuestions(topic, difficulty);

    final key = '${topic.name}_${difficulty.name}';
    final storedIndex = _box.get(key, defaultValue: 0) as int;

    final levelProgress = LevelProgress<Question>(
      questions: question,
      currentIndex: storedIndex,
    );

    final progress = Map<Topic, Map<Difficulty, LevelProgress<Question>>>.from(
      state.progress,
    );
    progress[topic] = Map<Difficulty, LevelProgress<Question>>.from(
      progress[topic] ?? {},
    );
    progress[topic]![difficulty] = levelProgress;

    emit(
      state.copyWith(
        progress: progress,
        currentTopic: topic,
        currentDifficulty: difficulty,
        currentRound: [],
        isLoading: false,
      ),
    );
  }

  void nextRound({int count = 5}) {
    final topic = state.currentTopic;
    final difficulty = state.currentDifficulty;
    if (topic == null || difficulty == null) return;

    final level = state.progress[topic]![difficulty]!;

    List<Question> questions = level.questions;
    int index = level.currentIndex;

    //TODO: if the quetions ends make a masseage that you finish all the avilable questions

    final round = questions.sublist(index, index + count);
    final updatedLevel = level.copyWith(
      questions: questions,
      currentIndex: index + count,
    );

    final key = '${topic.name}_${difficulty.name}';
    _box.put(key, updatedLevel.currentIndex);

    final updatedProgress =
        Map<Topic, Map<Difficulty, LevelProgress<Question>>>.from(
          state.progress,
        );
    updatedProgress[topic] = Map<Difficulty, LevelProgress<Question>>.from(
      updatedProgress[topic]!,
    );
    updatedProgress[topic]![difficulty] = updatedLevel;

    emit(state.copyWith(currentRound: round, progress: updatedProgress));
  }
}
