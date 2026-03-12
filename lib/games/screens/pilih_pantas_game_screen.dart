import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class PilihPantasGameScreen extends StatefulWidget {
  const PilihPantasGameScreen({super.key});

  @override
  State<PilihPantasGameScreen> createState() => _PilihPantasGameScreenState();
}

class _PilihPantasGameScreenState extends State<PilihPantasGameScreen> {
  static const List<String> _listWithMen = [
    'membaca',
    'menulis',
    'melukis',
    'menyapu',
    'memotong',
    'mengangkat',
  ];

  static const List<String> _listWithoutMen = [
    'buku',
    'pensel',
    'bola',
    'minum',
    'makan',
    'tidur',
  ];

  late Timer _ticker;
  final Random _random = Random();
  late DateTime _endTime;
  int _stars = 0;
  int _queueIndex = 0;
  bool _showStar = false;
  List<String> _queue = <String>[];

  String get _currentWord => _queue[_queueIndex];

  @override
  void initState() {
    super.initState();
    _queue = _buildRoundQueue();
    _endTime = DateTime.now().add(const Duration(seconds: 25));
    _ticker = Timer.periodic(const Duration(milliseconds: 250), (_) {
      if (!mounted) {
        return;
      }
      if (DateTime.now().isAfter(_endTime)) {
        _ticker.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => PilihPantasResultScreen(stars: _stars),
          ),
        );
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  List<String> _buildRoundQueue() {
    final all = [..._listWithMen, ..._listWithoutMen];
    all.shuffle(_random);
    return all;
  }

  void _advanceWord() {
    if (_queueIndex < _queue.length - 1) {
      setState(() => _queueIndex += 1);
      return;
    }
    final previous = _queue.last;
    final nextQueue = _buildRoundQueue();
    if (nextQueue.first == previous && nextQueue.length > 1) {
      final first = nextQueue.removeAt(0);
      nextQueue.add(first);
    }
    setState(() {
      _queue = nextQueue;
      _queueIndex = 0;
    });
  }

  void _answer(bool chooseMen) {
    final hasMen = _listWithMen.contains(_currentWord);
    if (chooseMen == hasMen) {
      setState(() {
        _stars += 1;
        _showStar = true;
      });
      Future<void>.delayed(const Duration(milliseconds: 260), () {
        if (!mounted) {
          return;
        }
        setState(() => _showStar = false);
      });
    }
    _advanceWord();
  }

  @override
  Widget build(BuildContext context) {
    final totalMs = 25000;
    final remainingMs = _endTime
        .difference(DateTime.now())
        .inMilliseconds
        .clamp(0, totalMs);
    final progress = remainingMs / totalMs;

    return Scaffold(
      backgroundColor: const Color(0xFFDFF3FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Expanded(
                    child: Text(
                      'Pilih Pantas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1D3557),
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 3,
                          color: const Color(0xFF2A9D8F),
                        ),
                      ),
                      const Icon(Icons.timer_rounded, size: 16),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 220),
                        child: Text(
                          _currentWord,
                          key: ValueKey(_currentWord),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF1D3557),
                          ),
                        ),
                      ),
                    ),
                    if (_showStar)
                      const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.star_rounded,
                          size: 64,
                          color: Color(0xFFF4B400),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => _answer(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2A9D8F),
                        ),
                        child: const Text(
                          'Ada meN-',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => _answer(false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8D99AE),
                        ),
                        child: const Text(
                          'Tiada meN-',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PilihPantasResultScreen extends StatelessWidget {
  const PilihPantasResultScreen({super.key, required this.stars});

  final int stars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6D9),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Pilih Pantas Tamat',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1D3557),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xFFF4B400),
                    size: 34,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '$stars',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Icon(
                Icons.sentiment_satisfied_rounded,
                size: 44,
                color: Color(0xFFF4B400),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PilihPantasGameScreen(),
                      ),
                    );
                  },
                  child: const Text('Main Lagi'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali ke Main'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
