import 'dart:async'; // For Timer
import 'dart:convert'; // For JSON decoding

import 'package:doodle_brain/models/enums.dart'; // Contains Topic, Difficulty, RoundStatus enums
import 'package:doodle_brain/models/levelProgress.dart'; // Generic LevelProgress model
import 'package:doodle_brain/models/question_model.dart'; // Question model
import 'package:doodle_brain/models/themes.dart';
import 'package:equatable/equatable.dart'; // For value comparison in states
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle (loading assets)
import 'package:flutter_bloc/flutter_bloc.dart'; // For Cubit state management
import 'package:hive_flutter/hive_flutter.dart'; // For local storage
import 'package:meta/meta.dart'; // For @immutable annotation

part 'quiz_state.dart'; // Connects this file with quiz_state.dart

// QuizCubit manages quiz logic and state
class QuizCubit extends Cubit<QuizState> {
  // Initial state with empty progress map
  QuizCubit() : super(QuizState(progress: {}));

  // Hive box for storing quiz progress locally
  final Box _box = Hive.box('quizProgress');

  // Cache to store loaded questions to avoid reloading from assets
  final Map<String, List<Question>> _cache = {};

  // Loads questions based on topic and difficulty
  Future<List<Question>> _loadQuestions(
    Topic topic,
    Difficulty difficulty,
  ) async {
    // Build file name dynamically
    final fileName = 'lib/assets/data/questions/${topic.name}/${difficulty.name}.json';

    // Return cached questions if already loaded
    if (_cache.containsKey(fileName)) return _cache[fileName]!;

    // Load JSON file from assets
    final jsonString = await rootBundle.loadString(fileName);

    // Decode JSON string
    final List decoded = jsonDecode(jsonString);

    // Convert JSON to Question objects
    final questions = decoded
        .map((e) => Question.fromJson(e))
        .toList(growable: false);

    // Save in cache
    _cache[fileName] = questions;

    return questions;
  }

  // Select a level (topic + difficulty)
  Future<void> selectLevel(Topic topic, Difficulty difficulty) async {
    print("SELECT LEVEL CALLED");
    emit(state.copyWith(isLoading: true));
    print(state.isLoading); // Show loading state

    // Load questions for selected level
    final question = await _loadQuestions(topic, difficulty);

    // Create unique key for storage
    final key = '${topic.name}_${difficulty.name}';

    // Get saved progress index from Hive (default 0)
    final storedIndex = _box.get(key, defaultValue: 0) as int;

    // Create LevelProgress object
    final levelProgress = LevelProgress<Question>(
      questions: question,
      currentIndex: storedIndex,
    );

    // Clone current progress map (immutability)
    final progress = Map<Topic, Map<Difficulty, LevelProgress<Question>>>.from(
      state.progress,
    );

    // Ensure topic map exists
    progress[topic] = Map<Difficulty, LevelProgress<Question>>.from(
      progress[topic] ?? {},
    );

    // Assign level progress
    progress[topic]![difficulty] = levelProgress;

    // Emit updated state
    
    emit(
      state.copyWith(
        progress: progress,
        currentTopic: topic,
        currentDifficulty: difficulty,
        currentRound: [],
        isLoading: false,
        currentMonsterUrl: monsterUrl[topic],
      ),
    );
    print(state.currentTopic);
  }

  // Move to next round (default 5 questions per round)
  void nextRound({int count = 5}) {
    print("next round");
    final topic = state.currentTopic;
    final difficulty = state.currentDifficulty;

    // If no topic/difficulty selected, exit
    if (topic == null || difficulty == null) return;

    final level = state.progress[topic]![difficulty]!;

    List<Question> questions = level.questions;
    int index = level.currentIndex;

    // TODO: Handle when questions end
    if (index >= questions.length) {
      emit(state.copyWith(isLevelFinished: true));
      return;
    }

    final end = (index + count > questions.length)
      ? questions.length
      : index + count;

    // Take next batch of questions
    final round = questions.sublist(index, end);

    print(round.length);

    // Update index
    final updatedLevel = level.copyWith(
      questions: questions,
      currentIndex: end,
    );

    // Save updated index in Hive
    final key = '${topic.name}_${difficulty.name}';
    _box.put(key, updatedLevel.currentIndex);

    // Clone progress map
    final updatedProgress =
        Map<Topic, Map<Difficulty, LevelProgress<Question>>>.from(
          state.progress,
        );

    updatedProgress[topic] = Map<Difficulty, LevelProgress<Question>>.from(
      updatedProgress[topic]!,
    );

    updatedProgress[topic]![difficulty] = updatedLevel;

    // Emit new round
    emit(state.copyWith(currentRound: round, progress: updatedProgress));
  }

  // Start a new round with initial stats
  void startRound() {
    nextRound(); // Load next batch of questions

    emit(
      state.copyWith(
        currentPlayerHealth: 2, // Player HP
        currentMonsterHealth: 5, // Monster HP
        remainingTime: 10, // 10 seconds per question
        roundStatus: RoundStatus.playing, // Round started
      ),
    );

    startTimer(); // Start countdown
  }

  Timer? _timer; // Timer instance

  // Start countdown timer
  void startTimer() {
    _timer?.cancel(); // Cancel previous timer if exists

    emit(state.copyWith(remainingTime: 10)); // Reset time

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime == 0) {
        timer.cancel(); // Stop timer
        timeUp(); // Apply damage if time ends
      } else {
        emit(
          state.copyWith(
            remainingTime: state.remainingTime - 1, // Decrease time
          ),
        );
      }
    });
  }

  // Called when time finishes
  void timeUp() {
    _applyDamage(isCorrect: false); // Treat as wrong answer
  }

  // When player selects an answer
  void submitAnswer(String selectedAnswer) {
    // Ignore if not in playing state
    if (state.roundStatus != RoundStatus.playing) return;

    _timer?.cancel(); // Stop timer

    // Check if answer is correct
    if (state.currentRound.isEmpty) return;

    final correct = selectedAnswer == state.currentRound.first.answer;  

    _applyDamage(isCorrect: correct);
  }

  // Handles damage logic for player and monster
  void _applyDamage({required bool isCorrect}) {

    if (state.roundStatus != RoundStatus.playing) return;

    int playerHealth = state.currentPlayerHealth;
    int monsterHealth = state.currentMonsterHealth;

    List<Question> updatedQuestions = List.from(state.currentRound);

    if (updatedQuestions.isEmpty) return;

    final currentQuestion = updatedQuestions.first;

    if (isCorrect) {
      monsterHealth--; // Monster takes damage
      updatedQuestions.removeAt(0); // Remove question
    } else {
      playerHealth--; // Player takes damage

      updatedQuestions.removeAt(0);
      updatedQuestions.add(currentQuestion); // Re-add question to end
    }

    // If player dies
    if (playerHealth <= 0) {
      _timer?.cancel();
      emit(
        state.copyWith(
          currentPlayerHealth: 0,
          roundStatus: RoundStatus.playerDead,
        ),
      );
      return;
    }

    // If monster dies
    if (monsterHealth <= 0) {
      _timer?.cancel();
      emit(
        state.copyWith(
          currentRound: [],
          currentMonsterHealth: 0,
          roundStatus: RoundStatus.monsterDead,
        ),
      );
      return;
    }

    // Continue round
    emit(
      state.copyWith(
        currentRound: updatedQuestions,
        currentPlayerHealth: playerHealth,
        currentMonsterHealth: monsterHealth,
        remainingTime: 10, // Reset timer
      ),
    );

    startTimer(); // Restart timer
  }


  void resetCurrentLevel() {
  final topic = state.currentTopic;
  final difficulty = state.currentDifficulty;

  if (topic == null || difficulty == null) return;

  final key = '${topic.name}_${difficulty.name}';

  // Reset Hive progress
  _box.put(key, 0);

  // Reset in-memory progress
  final updatedProgress = Map<Topic, Map<Difficulty, LevelProgress<Question>>>.from(state.progress);

  if (updatedProgress[topic] != null && updatedProgress[topic]![difficulty] != null) {
    final level = updatedProgress[topic]![difficulty]!;

    updatedProgress[topic]![difficulty] = level.copyWith(currentIndex: 0);
  }
  print(updatedProgress[topic]![difficulty]!.currentIndex);

  // Emit updated state
  emit(state.copyWith(
    progress: updatedProgress,
    currentRound: [], // clear current round
    isLevelFinished: false,
  ));
}

void resetAllProgress() {
  // Clear all Hive progress
  for (var topicEntry in state.progress.entries) {
    final topic = topicEntry.key;
    for (var difficultyEntry in topicEntry.value.entries) {
      final difficulty = difficultyEntry.key;
      final key = '${topic.name}_${difficulty.name}';
      _box.put(key, 0);
    }
  }

  // Reset all in-memory progress
  final updatedProgress = state.progress.map((topic, diffMap) {
    final resetDiffMap = diffMap.map((difficulty, level) {
      return MapEntry(difficulty, level.copyWith(currentIndex: 0));
    });
    return MapEntry(topic, resetDiffMap);
  });

  emit(state.copyWith(
    progress: updatedProgress,
    currentRound: [],
    isLevelFinished: false,
  ));
}
}
