import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/quiz_level.dart';
import 'quiz_shell_screen.dart';

class QuizLevelGatewayScreen extends StatefulWidget {
  const QuizLevelGatewayScreen({super.key, required this.name});

  final String name;

  @override
  State<QuizLevelGatewayScreen> createState() => _QuizLevelGatewayScreenState();
}

class _QuizLevelGatewayScreenState extends State<QuizLevelGatewayScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Widget _levelCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required int stars,
    required Color color,
    required QuizLevel level,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => QuizShellScreen(name: widget.name, level: level),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                final scale = 1 + (_pulseController.value * 0.08);
                return Transform.scale(scale: scale, child: child);
              },
              child: Row(
                children: List.generate(
                  stars,
                  (index) => const Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFFE066),
                    size: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E88E5), Color(0xFF42A5F5)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        final offset =
                            math.sin(_pulseController.value * math.pi) * 2;
                        return Transform.translate(
                          offset: Offset(0, offset),
                          child: child,
                        );
                      },
                      child: Image.asset(
                        'assets/aminPage3.png',
                        width: 98,
                        height: 98,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Text(
                          'Pilih tahap kuiz untuk bermula!',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF1D3557),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                _levelCard(
                  context: context,
                  title: 'Tahap Mudah',
                  subtitle: 'Soalan asas imbuhan meN-',
                  stars: 1,
                  color: const Color(0xFF2EAD63),
                  level: QuizLevel.easy,
                ),
                _levelCard(
                  context: context,
                  title: 'Tahap Sederhana',
                  subtitle: 'Ayat dan situasi harian',
                  stars: 2,
                  color: const Color(0xFFF4A52E),
                  level: QuizLevel.medium,
                ),
                _levelCard(
                  context: context,
                  title: 'Tahap Tinggi',
                  subtitle: 'Soalan mencabar dan konteks panjang',
                  stars: 3,
                  color: const Color(0xFFE45832),
                  level: QuizLevel.hard,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
