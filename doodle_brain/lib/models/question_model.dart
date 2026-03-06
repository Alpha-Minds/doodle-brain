class Question {
  final int id;
  final String question;
  final List<String> choices;
  final String answer;

  Question({
    required this.id,
    required this.question,
    required this.choices,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["id"],
      question: json["question"],
      choices: json["choices"],
      answer: json["answer"],
    );
  }
}
