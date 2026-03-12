import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../services/amin_tts_service.dart';
import 'learning_flow_screen.dart';

class BelajarFlowScreen extends StatefulWidget {
  const BelajarFlowScreen({super.key, required this.name});

  final String name;

  @override
  State<BelajarFlowScreen> createState() => _BelajarFlowScreenState();
}

class _BelajarFlowScreenState extends State<BelajarFlowScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  int _index = 0;
  bool _voiceEnabled = true;

  final List<_BelajarStep> _steps = const [
    _BelajarStep(
      id: 'S004',
      title: 'Apa itu Imbuhan?',
      body:
          'Imbuhan ialah morfem terikat yang tidak boleh berdiri sendiri. '
          'Imbuhan ditambah pada kata dasar untuk membentuk kata baharu.',
      examples: [
        'berlari',
        'tertawa',
        'membaca',
        'menjadikan',
        'dibelikan',
        'masakan',
      ],
      backgroundTop: Color(0xFFE7F7FF),
      backgroundBottom: Color(0xFFCFEFFF),
      voiceScript:
          'Imbuhan ialah morfem terikat yang tidak boleh berdiri sendiri. '
          'Imbuhan perlu ditambah pada kata dasar untuk membentuk kata baharu.',
    ),
    _BelajarStep(
      id: 'S005',
      title: 'Apa itu Imbuhan Awalan?',
      body:
          'Imbuhan awalan ialah imbuhan yang ditambah di hadapan kata dasar untuk membentuk kata baharu.',
      examples: [
        'ber + lari = berlari',
        'meN- + baca = membaca',
        'di + beli = dibeli',
        'ter + tidur = tertidur',
      ],
      backgroundTop: Color(0xFFFFF5CF),
      backgroundBottom: Color(0xFFFFE9A8),
      voiceScript:
          'Imbuhan awalan ialah imbuhan yang ditambah di hadapan kata dasar. '
          'Contohnya berlari, membaca, dibeli dan tertidur.',
    ),
    _BelajarStep(
      id: 'S006',
      title: 'Kenali Imbuhan Awalan meN-',
      body:
          'Imbuhan meN- digunakan untuk membentuk kata kerja. Ia menunjukkan sesuatu perbuatan atau tindakan.',
      examples: ['menari', 'memasak', 'mengecat'],
      backgroundTop: Color(0xFFE4F1FF),
      backgroundBottom: Color(0xFFCFE3FF),
      voiceScript:
          'Imbuhan meN- digunakan untuk membentuk kata kerja. '
          'Contohnya menari, memasak dan mengecat.',
    ),
  ];

  _BelajarStep get _current => _steps[_index];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => _speakCurrent());
  }

  @override
  void dispose() {
    _pulseController.dispose();
    AminTtsService.instance.stop();
    super.dispose();
  }

  Future<void> _speakCurrent() async {
    if (!_voiceEnabled || _current.voiceScript.isEmpty) {
      return;
    }
    await AminTtsService.instance.speak(_current.voiceScript);
  }

  void _toggleVoice() {
    setState(() {
      _voiceEnabled = !_voiceEnabled;
    });
    if (_voiceEnabled) {
      _speakCurrent();
    } else {
      AminTtsService.instance.stop();
    }
  }

  void _next() {
    if (_index == _steps.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LearningFlowScreen(name: widget.name),
        ),
      );
      return;
    }
    setState(() {
      _index += 1;
    });
    _speakCurrent();
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_index + 1) / _steps.length;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_current.backgroundTop, _current.backgroundBottom],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 6,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _speakCurrent,
                      icon: const Icon(Icons.volume_up_rounded),
                    ),
                    IconButton(
                      onPressed: _toggleVoice,
                      icon: Icon(
                        _voiceEnabled
                            ? Icons.hearing_rounded
                            : Icons.hearing_disabled_rounded,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 280),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.04, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    ),
                    child: Container(
                      key: ValueKey(_current.id),
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.75),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _current.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1D3557),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FCFF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _current.body,
                              style: const TextStyle(
                                fontSize: 16,
                                height: 1.35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'Contoh',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0B7285),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: _current.examples.asMap().entries.map(
                                  (entry) {
                                    final i = entry.key;
                                    final text = entry.value;
                                    return TweenAnimationBuilder<double>(
                                      key: ValueKey('${_current.id}-chip-$i'),
                                      tween: Tween(begin: 0, end: 1),
                                      duration: Duration(
                                        milliseconds: 300 + (i * 90),
                                      ),
                                      builder: (context, value, child) {
                                        return Opacity(
                                          opacity: value,
                                          child: Transform.translate(
                                            offset: Offset(0, (1 - value) * 10),
                                            child: child,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 9,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF0EA5E9),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          text,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: _next,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFC300),
                                foregroundColor: const Color(0xFF1D3557),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: AnimatedBuilder(
                                animation: _pulseController,
                                builder: (context, child) {
                                  final angle =
                                      math.sin(
                                        _pulseController.value * math.pi,
                                      ) *
                                      0.04;
                                  return Transform.rotate(
                                    angle: angle,
                                    child: Text(
                                      'Teruskan',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BelajarStep {
  const _BelajarStep({
    required this.id,
    required this.title,
    required this.body,
    required this.examples,
    required this.backgroundTop,
    required this.backgroundBottom,
    this.voiceScript = '',
  });

  final String id;
  final String title;
  final String body;
  final List<String> examples;
  final Color backgroundTop;
  final Color backgroundBottom;
  final String voiceScript;
}
