import 'package:flutter/material.dart';
import '../data/content_repository.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = ContentRepository.getGlossary();

    return Scaffold(
      backgroundColor: const Color(0xFF0d1b2a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF112240),
        elevation: 0,
        title: const Text(
          '📋 Glossary',
          style: TextStyle(
              color: Color(0xFF5DCAA5),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: entries.length,
        itemBuilder: (ctx, i) {
          final e = entries[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF112240),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.en,
                    style: const TextStyle(
                        color: Color(0xFFe8f4f8),
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('(${e.pt})',
                    style: const TextStyle(
                        color: Color(0xFF8aafc4), fontSize: 11)),
                const SizedBox(height: 6),
                Text(e.def,
                    style: const TextStyle(
                        color: Color(0xFF8aafc4),
                        fontSize: 11,
                        height: 1.5)),
              ],
            ),
          );
        },
      ),
    );
  }
}

