part of 'quiz_cubit.dart';

@immutable
class QuizState extends Equatable {
  final Map<Topic, Map<Difficulty, LevelProgress<Question>>> progress;
  final Topic? currentTopic;
  final Difficulty? currentDifficulty;
  final List<Question> currentRound;
  final bool isLoading;

  QuizState({
    required this.progress,
    this.currentTopic,
    this.currentDifficulty,
    this.currentRound = const [],
    this.isLoading = false,
  });

  QuizState copyWith({
    Map<Topic, Map<Difficulty, LevelProgress<Question>>>? progress,
    Topic? currentTopic,
    Difficulty? currentDifficulty,
    List<Question>? currentRound,
    bool? isLoading,
  }) {
    return QuizState(
      progress: progress ?? this.progress,
      currentTopic: currentTopic ?? this.currentTopic,
      currentDifficulty: currentDifficulty ?? this.currentDifficulty,
      currentRound: currentRound ?? this.currentRound,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    progress,
    currentTopic,
    currentDifficulty,
    currentRound,
    isLoading,
  ];
}
