import 'package:flutter/material.dart';

import '../models/quiz_level.dart';
import 'quiz_shell_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({
    super.key,
    required this.name,
    required this.level,
    required this.totalQuestions,
    required this.autoGradedQuestions,
    required this.correctAnswers,
    required this.manualCompleted,
  });

  final String name;
  final QuizLevel? level;
  final int totalQuestions;
  final int autoGradedQuestions;
  final int correctAnswers;
  final int manualCompleted;

  int get _autoPercent {
    if (autoGradedQuestions == 0) {
      return 0;
    }
    return ((correctAnswers / autoGradedQuestions) * 100).round();
  }

  QuizLevel? get _nextLevel {
    switch (level) {
      case QuizLevel.easy:
        return QuizLevel.medium;
      case QuizLevel.medium:
        return QuizLevel.hard;
      case QuizLevel.hard:
      case null:
        return null;
    }
  }

  String _nextLevelLabel(QuizLevel next) {
    switch (next) {
      case QuizLevel.easy:
        return 'Tahap Mudah';
      case QuizLevel.medium:
        return 'Tahap Sederhana';
      case QuizLevel.hard:
        return 'Tahap Tinggi';
    }
  }

  @override
  Widget build(BuildContext context) {
    final nextLevel = _nextLevel;

    return Scaffold(
      backgroundColor: const Color(0xFFEEF9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF9FF),
        elevation: 0,
        title: const Text(
          'Keputusan Kuiz',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tahniah, $name!',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1D3557),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Jumlah soalan: $totalQuestions'),
                  Text('Soalan auto-markah: $autoGradedQuestions'),
                  Text('Jawapan betul (auto): $correctAnswers'),
                  Text('Skor auto: $_autoPercent%'),
                  Text('Soalan manual ditanda siap: $manualCompleted'),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.star_rounded, color: Color(0xFFF4B400)),
                      Icon(
                        Icons.sentiment_satisfied_rounded,
                        color: Color(0xFFF4B400),
                        size: 32,
                      ),
                      Icon(Icons.star_rounded, color: Color(0xFFF4B400)),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (nextLevel != null)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            QuizShellScreen(name: name, level: nextLevel),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC300),
                    foregroundColor: const Color(0xFF1D3557),
                  ),
                  child: Text(
                    _nextLevelLabel(nextLevel),
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            if (nextLevel != null) const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text('Menu Utama'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
