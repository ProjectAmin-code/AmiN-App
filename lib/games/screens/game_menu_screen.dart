import 'package:flutter/material.dart';

import 'cari_bulatkan_game_screen.dart';
import 'cari_kumpul_game_screen.dart';
import 'pilih_pantas_game_screen.dart';

class GameMenuScreen extends StatelessWidget {
  const GameMenuScreen({super.key});

  Widget _menuButton({
    required BuildContext context,
    required String label,
    required Color color,
    required Widget destination,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: 280,
        height: 58,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => destination),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              height: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [Color(0xFF2F90F5), Color(0xFF0C54C9)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Main',
                  style: TextStyle(
                    color: Color(0xFFFFE04A),
                    fontSize: 52,
                    height: 1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 24),
                _menuButton(
                  context: context,
                  label: 'Pilih Pantas',
                  color: const Color(0xFFFF7F22),
                  destination: const PilihPantasGameScreen(),
                ),
                _menuButton(
                  context: context,
                  label: 'Cari & Kumpul',
                  color: const Color(0xFFFFC233),
                  destination: const CariKumpulGameScreen(),
                ),
                _menuButton(
                  context: context,
                  label: 'Cari & Bulatkan',
                  color: const Color(0xFF66C637),
                  destination: const CariBulatkanGameScreen(),
                ),
                const SizedBox(height: 18),
                OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('Kembali'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white70),
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
