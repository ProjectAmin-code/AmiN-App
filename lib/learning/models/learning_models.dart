import 'package:flutter/material.dart';

enum LearningStepType { table, changeCards, situation, summary, quizGateway }

class LearningRuleRow {
  const LearningRuleRow({required this.cells});

  final List<String> cells;
}

class LearningChangeCard {
  const LearningChangeCard({
    required this.letter,
    required this.example,
    required this.note,
  });

  final String letter;
  final String example;
  final String note;
}

class LearningHotspot {
  const LearningHotspot({
    required this.label,
    required this.baseWord,
    required this.derivedWord,
    required this.alignment,
    this.icon = Icons.star_rounded,
  });

  final String label;
  final String baseWord;
  final String derivedWord;
  final Alignment alignment;
  final IconData icon;
}

class LearningSummaryCard {
  const LearningSummaryCard({
    required this.prefix,
    required this.ruleText,
    required this.example,
  });

  final String prefix;
  final String ruleText;
  final String example;
}

class LearningStep {
  const LearningStep({
    required this.id,
    required this.title,
    required this.type,
    this.subtitle = '',
    this.voiceScript = '',
    this.buttonText = 'Teruskan',
    this.backgroundTop = const Color(0xFFE7F8FF),
    this.backgroundBottom = const Color(0xFFC7EDFF),
    this.tableHeaders = const [],
    this.tableRows = const [],
    this.footerNote = '',
    this.changeCards = const [],
    this.hotspots = const [],
    this.summaryCards = const [],
  });

  final String id;
  final String title;
  final String subtitle;
  final String voiceScript;
  final String buttonText;
  final LearningStepType type;
  final Color backgroundTop;
  final Color backgroundBottom;
  final List<String> tableHeaders;
  final List<LearningRuleRow> tableRows;
  final String footerNote;
  final List<LearningChangeCard> changeCards;
  final List<LearningHotspot> hotspots;
  final List<LearningSummaryCard> summaryCards;
}
