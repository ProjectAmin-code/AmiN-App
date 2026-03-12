import 'package:aminapp/screens/screen6.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  final String name;
  const Screen5({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9E29B), // soft yellow
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9E29B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2D9CDB)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Apa Itu Imbuhan Awalan?",
          style: TextStyle(
            color: Color(0xFF2D9CDB),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3C9), // cream card
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 4),

                    // Bubble title (center)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBEE8FF),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFF2D9CDB),
                          width: 3,
                        ),
                      ),
                      child: const Text(
                        "APA ITU\nIMBUHAN\nAWALAN?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          height: 1.05,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1F4E79),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Definition row: left (avatar + orange hand button), right (definition box)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left column (avatar + orange square)
                        Column(
                          children: [
                            // Avatar circle
                            Container(
                              width: 78,
                              height: 78,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFD4B3),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF2E2E2E),
                                  width: 1,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/boy.png', // <-- letak gambar budak di sini
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Center(
                                        child: Icon(
                                          Icons.face,
                                          size: 40,
                                          color: Color(0xFF2E2E2E),
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Orange square with hand icon
                            Container(
                              width: 78,
                              height: 64,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2994A),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color(0xFF2E2E2E),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/hand.png', // <-- ikon tangan
                                  width: 28,
                                  height: 28,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.touch_app_rounded,
                                        size: 28,
                                        color: Color(0xFF2E2E2E),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 14),

                        // Right definition box
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF7DC),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFB7B7B7),
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              "Imbuhan awalan\nialah imbuhan yang\nditambah di hadapan\nkata dasar untuk\nmembentuk kata\nbaharu.",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.25,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2E2E2E),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Examples list (exact style)
                    _ExampleRow(
                      pillText: "ber",
                      pillColor: Color(0xFFF2C94C),
                      wordIconAsset: "assets/run.png",
                      wordFallbackIcon: "🏃",
                      wordText: "lari",
                      isBold: false,
                    ),
                    const SizedBox(height: 12),
                    _ExampleRow(
                      pillText: "meN-",
                      pillColor: Color(0xFFF2994A),
                      wordIconAsset: null,
                      wordFallbackIcon: "",
                      wordText: "membaca",
                      isBold: true,
                    ),
                    const SizedBox(height: 12),
                    _ExampleRow(
                      pillText: "di",
                      pillColor: Color(0xFF56CCF2),
                      wordIconAsset: null,
                      wordFallbackIcon: "",
                      wordText: "dibeli",
                      isBold: true,
                    ),
                    const SizedBox(height: 12),
                    _ExampleRow(
                      pillText: "ter",
                      pillColor: Color(0xFF6FCF97),
                      wordIconAsset: "assets/zzz.png",
                      wordFallbackIcon: "💤",
                      wordText: "tertidur",
                      isBold: true,
                    ),

                    const Spacer(),

                    // Bottom button (big)
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Screen6(name: name),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0288D1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Teruskan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(
                              0xFFE91E63,
                            ), // pink-ish text macam gambar
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// One example row: [pill] + + [book box] + (icon) word
class _ExampleRow extends StatelessWidget {
  final String pillText;
  final Color pillColor;
  final String? wordIconAsset; // optional asset icon (run/zzz)
  final String wordFallbackIcon; // emoji fallback
  final String wordText;
  final bool isBold;

  const _ExampleRow({
    required this.pillText,
    required this.pillColor,
    required this.wordIconAsset,
    required this.wordFallbackIcon,
    required this.wordText,
    required this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Pill
        Container(
          width: 68,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: pillColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            pillText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 10),

        const Text(
          "+",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Color(0xFF2E2E2E),
          ),
        ),
        const SizedBox(width: 10),

        // Book box (blue)
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF9BD7FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.menu_book_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),

        // optional icon + word
        if (wordIconAsset != null) ...[
          Image.asset(
            wordIconAsset!,
            width: 18,
            height: 18,
            errorBuilder: (context, error, stackTrace) =>
                Text(wordFallbackIcon, style: const TextStyle(fontSize: 18)),
          ),
          const SizedBox(width: 8),
        ] else if (wordFallbackIcon.isNotEmpty) ...[
          Text(wordFallbackIcon, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
        ],

        Text(
          wordText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: isBold ? FontWeight.w900 : FontWeight.w700,
            color: const Color(0xFF2E2E2E),
          ),
        ),
      ],
    );
  }
}
