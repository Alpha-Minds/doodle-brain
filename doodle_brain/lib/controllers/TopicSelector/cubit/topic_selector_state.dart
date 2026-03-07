part of 'topic_selector_cubit.dart';

@immutable
class TopicSelectorState extends Equatable{
  final Topic currentTopic;
  final Difficulty currentDifficulty;

  const TopicSelectorState({
    required this.currentTopic,
    required this.currentDifficulty,
  });
  TopicSelectorState copyWith({
    Topic? currentTopic,
    Difficulty? currentDifficulty,
  }) {
    return TopicSelectorState(
      currentTopic: currentTopic ?? this.currentTopic,
      currentDifficulty: currentDifficulty ?? this.currentDifficulty,
    );
  }
  
  @override
  List<Object?> get props => [currentTopic,currentDifficulty];
}
