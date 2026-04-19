import 'package:bloc/bloc.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

part 'topic_selector_state.dart';

class TopicSelectorCubit extends Cubit<TopicSelectorState> {
  final Box box = Hive.box('settings');

  TopicSelectorCubit()
    : super(
        TopicSelectorState(
          currentTopic: Topic.general,
          currentDifficulty: Difficulty.easy,
        ),
      ) {
    _loadSavedData();
  }

  void _loadSavedData() {
    final topicString = box.get('topic', defaultValue: 'General');
    final difficultyString = box.get('difficulty', defaultValue: 'Easy');

    emit(
      state.copyWith(
        currentTopic: _mapTopic(topicString),
        currentDifficulty: _mapDifficulty(difficultyString),
      ),
    );
  }

  Difficulty _mapDifficulty(String label) {
    switch (label) {
      case "Medium":
        return Difficulty.intermediate;
      case "Hard":
        return Difficulty.hard;
      default:
        return Difficulty.easy;
    }
  }

  Topic _mapTopic(String label) {
    switch (label) {
      case "Islamic":
        return Topic.islam;
      case "Math":
        return Topic.math;
      case "Programming":
        return Topic.programming;
      default:
        return Topic.general;
    }
  }

  void changeDifficulty(String label) {
    Difficulty diff = _mapDifficulty(label);

    box.put('difficulty', label);

    emit(state.copyWith(currentDifficulty: diff));
  }

  void changeTopic(String label) {
    Topic topic = _mapTopic(label);

    box.put('topic', label);

    emit(state.copyWith(currentTopic: topic));
  }
}
