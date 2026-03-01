part of 'quiz_cubit.dart';

@immutable
class QuizState extends Equatable {
  final Map<Topic, String> monsterUrl = {
    Topic.islam: "lib/assets/graphics/enemies/islam.png",
    Topic.general: "lib/assets/graphics/enemies/islam.png",
    Topic.math: "lib/assets/graphics/enemies/islam.png",
    Topic.programming: "lib/assets/graphics/enemies/islam.png",
  };

  final Map<Topic, Map<Difficulty, LevelProgress<Question>>> progress;
  final Topic? currentTopic;
  final Difficulty? currentDifficulty;
  final List<Question> currentRound;
  final String? currentMonsterUrl;
  final int currentMonsterHealth;
  final int currentPlayerHealth;
  final bool isLoading;
  final bool isLevelFinished;

  final int remainingTime;
  final RoundStatus roundStatus;

  QuizState({
    required this.progress,
    this.currentTopic,
    this.currentDifficulty,
    this.currentRound = const [],
    this.isLoading = false,
    this.isLevelFinished = false,
    this.currentMonsterUrl,
    this.currentMonsterHealth=5,
    this.currentPlayerHealth=2,
    this.remainingTime = 10,
    this.roundStatus = RoundStatus.playing,
  });

  QuizState copyWith({
    Map<Topic, Map<Difficulty, LevelProgress<Question>>>? progress,
    Topic? currentTopic,
    Difficulty? currentDifficulty,
    List<Question>? currentRound,
    bool? isLoading,
    bool? isLevelFinished,
    String? currentMonsterUrl,
    int? currentMonsterHealth,
    int? currentPlayerHealth,
  int? remainingTime,
   RoundStatus? roundStatus,


  }) {
    return QuizState(
      progress: progress ?? this.progress,
      currentTopic: currentTopic ?? this.currentTopic,
      currentDifficulty: currentDifficulty ?? this.currentDifficulty,
      currentRound: currentRound ?? this.currentRound,
      isLoading: isLoading ?? this.isLoading,
      isLevelFinished: isLevelFinished ?? this.isLevelFinished,
      currentMonsterUrl: currentMonsterUrl??this.currentMonsterUrl,
      currentMonsterHealth:currentMonsterHealth??this.currentMonsterHealth,
      currentPlayerHealth: currentPlayerHealth??this.currentPlayerHealth,
      remainingTime: remainingTime??this.remainingTime,
      roundStatus: roundStatus??this.roundStatus
    );
  }


  @override
  List<Object?> get props => [
    progress,
    currentTopic,
    currentDifficulty,
    currentRound,
    isLoading,
    isLevelFinished,
    currentMonsterUrl,
    currentMonsterHealth,
    currentPlayerHealth
  ];
}
