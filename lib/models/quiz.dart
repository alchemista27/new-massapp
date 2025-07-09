class Quiz {
  final String id;
  final String title;
  final List<String> questions;
  final Map<String, dynamic>? answers;
  final double? grade;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
    this.answers,
    this.grade,
  });
}
