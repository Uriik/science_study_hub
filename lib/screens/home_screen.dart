import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/content_repository.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int) onNavigateToLesson;

  const HomeScreen({super.key, required this.onNavigateToLesson});

  @override
  Widget build(BuildContext context) {
    final modules = ContentRepository.getModules();

    return Scaffold(
      backgroundColor: const Color(0xFF0d1b2a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF112240),
        elevation: 0,
        title: const Text(
          '🔬 Science Study Hub',
          style: TextStyle(
            color: Color(0xFF5DCAA5),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: modules.length,
        itemBuilder: (ctx, i) => _ModuleCard(
          module: modules[i],
          onTap: () => onNavigateToLesson(i),
        ),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final Module module;
  final VoidCallback onTap;

  const _ModuleCard({required this.module, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF112240),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(module.icon, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 8),
            Text(
              module.title,
              style: const TextStyle(
                color: Color(0xFFe8f4f8),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              '(${module.pt})',
              style: const TextStyle(color: Color(0xFF8aafc4), fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF1a3358),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Study now ▶',
                style: TextStyle(
                  color: Color(0xFF5DCAA5),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

