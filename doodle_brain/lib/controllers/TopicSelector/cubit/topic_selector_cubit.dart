import 'package:bloc/bloc.dart';
import 'package:doodle_brain/models/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'topic_selector_state.dart';

class TopicSelectorCubit extends Cubit<TopicSelectorState> {
  TopicSelectorCubit()
    : super(
        TopicSelectorState(
          currentTopic: Topic.general,
          currentDifficulty: Difficulty.easy,
        ),
      );

  void changeDifficulty(String label){
    Difficulty diff=Difficulty.easy;
    switch (label) {
      case "Easy":
        diff=Difficulty.easy;
        break;
      case "Medium":
        diff=Difficulty.intermediate;
        break;
      case "Hard":
        diff=Difficulty.hard;
        break;
    }
    emit(state.copyWith(currentDifficulty: diff));
  }
  void changeTopic(String label){
    Topic topic=Topic.general;
    switch (label) {
      case "General":
        topic=Topic.general;
        break;
      case "Islamic":
        topic=Topic.islam;
        break;
      case "Math":
        topic=Topic.math;
        break;
      case "Programming":
        topic=Topic.programming;
        break;
    }
    emit(state.copyWith(currentTopic: topic));
  }
}
