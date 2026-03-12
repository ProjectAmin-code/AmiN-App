import 'quiz_interaction_type.dart';
import 'quiz_level.dart';
import 'quiz_option.dart';

class QuizQuestion {
  const QuizQuestion({
    required this.id,
    required this.order,
    required this.title,
    required this.prompt,
    required this.level,
    required this.interactionType,
    this.options = const [],
    this.correctOptionIds = const {},
    this.acceptableTextAnswers = const [],
    this.imageReferences = const [],
    this.helperLines = const [],
    this.matchingLeft = const [],
    this.matchingChoices = const [],
    this.matchingAnswers = const [],
    this.dragTargets = const [],
    this.dragChoices = const [],
    this.dragAnswers = const [],
    this.isAutoGraded = true,
    this.explanation = '',
  });

  final String id;
  final int order;
  final String title;
  final String prompt;
  final QuizLevel level;
  final QuizInteractionType interactionType;
  final List<QuizOption> options;
  final Set<String> correctOptionIds;
  final List<String> acceptableTextAnswers;
  final List<String> imageReferences;
  final List<String> helperLines;
  final List<String> matchingLeft;
  final List<String> matchingChoices;
  final List<String> matchingAnswers;
  final List<String> dragTargets;
  final List<String> dragChoices;
  final List<String> dragAnswers;
  final bool isAutoGraded;
  final String explanation;
}
