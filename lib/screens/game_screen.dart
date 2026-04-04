import 'package:flutter/material.dart';
import '../data/content_repository.dart';
import '../models/models.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _zoneIndex = 0;
  bool _zoneAnswered = false;
  bool? _lastCorrect;
  final List<String> _evidence = [];

  void _reset() {
    setState(() {
      _zoneIndex = 0;
      _zoneAnswered = false;
      _lastCorrect = null;
      _evidence.clear();
    });
  }

  void _handleAnswer(GameZone zone, int ansIdx) {
    final correct = ansIdx == zone.ans;
    setState(() {
      _zoneAnswered = true;
      _lastCorrect = correct;
      if (correct && !_evidence.contains(zone.evidenceItem)) {
        _evidence.add(zone.evidenceItem);
      }
    });
  }

  void _nextZone(int total) {
    setState(() {
      if (_zoneIndex < total - 1) {
        _zoneIndex++;
      } else {
        _zoneIndex = total; // triggers diagnosis screen
      }
      _zoneAnswered = false;
      _lastCorrect = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final zones = ContentRepository.getGameZones();

    return Scaffold(
      backgroundColor: const Color(0xFF0d1b2a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF112240),
        elevation: 0,
        title: const Text('🔬 Bio Mission',
            style: TextStyle(
                color: Color(0xFF5DCAA5),
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body: Column(
        children: [
          // Zone selector + evidence bar
          _buildZoneBar(zones),
          // Main scene
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(14),
              child: _zoneIndex >= zones.length
                  ? _buildDiagnosis()
                  : _buildScene(zones[_zoneIndex], zones.length),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZoneBar(List<GameZone> zones) {
    return Container(
      color: const Color(0xFF112240),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Zone buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(zones.length, (i) {
                final enabled = i <= _zoneIndex;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    onPressed: enabled
                        ? () => setState(() {
                              _zoneIndex = i;
                              _zoneAnswered = false;
                              _lastCorrect = null;
                            })
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: i == _zoneIndex
                          ? const Color(0xFF5DCAA5)
                          : const Color(0xFF1a3358),
                      disabledBackgroundColor:
                          const Color(0xFF1a3358).withOpacity(0.4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      minimumSize: Size.zero,
                    ),
                    child: Text(
                      zones[i].name,
                      style: TextStyle(
                        color: i == _zoneIndex
                            ? const Color(0xFF0d1b2a)
                            : enabled
                                ? const Color(0xFFe8f4f8)
                                : const Color(0xFF8aafc4),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 6),
          // Evidence pips
          Row(
            children: List.generate(zones.length, (i) => Container(
              width: 14,
              height: 14,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                color: i < _evidence.length
                    ? const Color(0xFF5DCAA5)
                    : const Color(0xFF1a3358),
                borderRadius: BorderRadius.circular(3),
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildScene(GameZone zone, int total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Zone title
        Text('🔍 ${zone.name}',
            style: const TextStyle(
                color: Color(0xFF5DCAA5),
                fontSize: 13,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text('(${zone.pt})',
            style: const TextStyle(color: Color(0xFF8aafc4), fontSize: 11)),
        const SizedBox(height: 12),

        // Scenario transmission box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1a3358),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('▶ TRANSMISSION: ${zone.intro}',
                  style: const TextStyle(
                      color: Color(0xFF5DCAA5), fontSize: 12)),
              const SizedBox(height: 4),
              Text('(${zone.introPt})',
                  style: const TextStyle(
                      color: Color(0xFF8aafc4), fontSize: 11)),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Question
        Text(zone.q,
            style: const TextStyle(
                color: Color(0xFFe8f4f8),
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text('(${zone.qPt})',
            style: const TextStyle(color: Color(0xFF8aafc4), fontSize: 11)),
        const SizedBox(height: 12),

        // Options
        ...List.generate(zone.opts.length, (i) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _zoneAnswered ? null : () => _handleAnswer(zone, i),
              style: ElevatedButton.styleFrom(
                backgroundColor: _getOptionColor(zone, i),
                disabledBackgroundColor: _getOptionColor(zone, i),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 12),
              ),
              child: Text(zone.opts[i],
                  style: const TextStyle(
                      color: Color(0xFFe8f4f8), fontSize: 13)),
            ),
          ),
        )),

        // Feedback
        if (_zoneAnswered) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1a3358),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _lastCorrect == true ? '✔ CORRECT!' : '✗ Not quite...',
                  style: TextStyle(
                    color: _lastCorrect == true
                        ? const Color(0xFF5DCAA5)
                        : const Color(0xFFF0997B),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(zone.feedback,
                    style: TextStyle(
                        color: _lastCorrect == true
                            ? const Color(0xFF5DCAA5)
                            : const Color(0xFFF0997B),
                        fontSize: 12)),
                const SizedBox(height: 4),
                Text('(${zone.feedbackPt})',
                    style: const TextStyle(
                        color: Color(0xFF8aafc4), fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _nextZone(total),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5DCAA5)),
              child: Text(
                _zoneIndex < total - 1
                    ? 'Next Zone →'
                    : 'Final Diagnosis! 🦠',
                style: const TextStyle(
                    color: Color(0xFF0d1b2a),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Color _getOptionColor(GameZone zone, int i) {
    if (!_zoneAnswered) return const Color(0xFF1a3358);
    if (i == zone.ans) return const Color(0xFF5DCAA5).withOpacity(0.3);
    return const Color(0xFF1a3358);
  }

  Widget _buildDiagnosis() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          const Text('// DIAGNOSIS COMPLETE',
              style: TextStyle(
                  color: Color(0xFF5DCAA5),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('(Diagnóstico Completo)',
              style: TextStyle(color: Color(0xFF8aafc4), fontSize: 13)),
          const SizedBox(height: 20),
          const Text('🦠 COMMON COLD — Rhinovirus',
              style: TextStyle(
                  color: Color(0xFF5DCAA5),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Evidence collected:',
                style: TextStyle(
                    color: Color(0xFFe8f4f8),
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
          ),
          const SizedBox(height: 8),
          ..._evidence.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ',
                        style: TextStyle(color: Color(0xFF5DCAA5))),
                    Expanded(
                        child: Text(e,
                            style: const TextStyle(
                                color: Color(0xFF8aafc4),
                                fontSize: 12))),
                  ],
                ),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _reset,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1a3358)),
            child: const Text('🔄 Play Again',
                style: TextStyle(color: Color(0xFF5DCAA5))),
          ),
        ],
      ),
    );
  }
}

