import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key, required this.name});

  final String name;

  Widget _progressTile({
    required String title,
    required String subtitle,
    required double value,
    required Color color,
  }) {
    final percent = (value * 100).round();
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 2),
          Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              color: color,
              backgroundColor: const Color(0xFFE8EDF2),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$percent%',
            style: const TextStyle(
              color: Color(0xFF1D3557),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF7FF),
        elevation: 0,
        title: const Text(
          'Kemajuan',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kemajuan pembelajaran $name',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1D3557),
              ),
            ),
            const SizedBox(height: 14),
            _progressTile(
              title: 'Belajar',
              subtitle: 'Modul pembelajaran imbuhan meN-',
              value: 0.65,
              color: const Color(0xFF2A9D8F),
            ),
            _progressTile(
              title: 'Kuiz',
              subtitle: 'Ketepatan jawapan tahap terkini',
              value: 0.48,
              color: const Color(0xFFF4A261),
            ),
            _progressTile(
              title: 'Main',
              subtitle: 'Penyertaan mini game',
              value: 0.42,
              color: const Color(0xFFE76F51),
            ),
            const Spacer(),
            const Text(
              'Nota: Nilai ini adalah paparan awal. Simpanan progres sebenar akan diaktifkan seterusnya.',
              style: TextStyle(
                color: Color(0xFF4A5568),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
