class LevelProgress<T> {
  final List<T> questions;
  final int currentIndex;

  LevelProgress({required this.questions, required this.currentIndex});

  LevelProgress<T> copyWith({List<T>? questions, int? currentIndex}) {
    return LevelProgress<T>(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
