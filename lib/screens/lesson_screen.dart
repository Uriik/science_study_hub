import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/content_repository.dart';

class LessonScreen extends StatefulWidget {
  final int moduleIndex;

  const LessonScreen({super.key, required this.moduleIndex});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Flashcard state
  int _fcIndex = 0;
  bool _fcFlipped = false;
  final Set<int> _known = {};
  final Set<int> _review = {};

  // Quiz state
  final Map<int, int> _quizAnswers = {};
  int? _quizScore;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didUpdateWidget(LessonScreen old) {
    super.didUpdateWidget(old);
    if (old.moduleIndex != widget.moduleIndex) {
      _resetLesson();
    }
  }

  void _resetLesson() {
    setState(() {
      _fcIndex = 0;
      _fcFlipped = false;
      _known.clear();
      _review.clear();
      _quizAnswers.clear();
      _quizScore = null;
      _tabController.index = 0;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modules = ContentRepository.getModules();
    final idx = widget.moduleIndex.clamp(0, modules.length - 1);
    final module = modules[idx];

    return Scaffold(
      backgroundColor: const Color(0xFF0d1b2a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF112240),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${module.icon} ${module.title}',
              style: const TextStyle(
                  color: Color(0xFFe8f4f8),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '(${module.pt})',
              style: const TextStyle(color: Color(0xFF8aafc4), fontSize: 11),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF5DCAA5),
          labelColor: const Color(0xFF5DCAA5),
          unselectedLabelColor: const Color(0xFF8aafc4),
          tabs: const [
            Tab(text: '📖 Learn'),
            Tab(text: '🃏 Flashcards'),
            Tab(text: '🎯 Quiz'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _LearnTab(module: module),
          _FlashcardsTab(
            module: module,
            fcIndex: _fcIndex,
            fcFlipped: _fcFlipped,
            known: _known,
            review: _review,
            onNavigate: (newIdx, flipped) =>
                setState(() { _fcIndex = newIdx; _fcFlipped = flipped; }),
            onKnown: () => setState(() {
              _known.add(_fcIndex);
              _review.remove(_fcIndex);
              _fcIndex = (_fcIndex + 1) % module.concepts.length;
              _fcFlipped = false;
            }),
            onReview: () => setState(() {
              _review.add(_fcIndex);
              _known.remove(_fcIndex);
              _fcIndex = (_fcIndex + 1) % module.concepts.length;
              _fcFlipped = false;
            }),
            onFlip: () => setState(() => _fcFlipped = !_fcFlipped),
          ),
          _QuizTab(
            module: module,
            quizAnswers: _quizAnswers,
            quizScore: _quizScore,
            onAnswer: (qIdx, ansIdx) =>
                setState(() => _quizAnswers[qIdx] = ansIdx),
            onSubmit: () => setState(() {
              _quizScore = _quizAnswers.entries
                  .where((e) => e.value == module.quiz[e.key].ans)
                  .length;
            }),
            onReset: () => setState(() {
              _quizAnswers.clear();
              _quizScore = null;
            }),
          ),
        ],
      ),
    );
  }
}

// ── Learn Tab ─────────────────────────────────────────────────────────────────

class _LearnTab extends StatelessWidget {
  final Module module;
  const _LearnTab({required this.module});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(14),
      itemCount: module.concepts.length,
      itemBuilder: (ctx, i) {
        final c = module.concepts[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF112240),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(c.en,
                  style: const TextStyle(
                      color: Color(0xFFe8f4f8),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('(${c.pt})',
                  style: const TextStyle(
                      color: Color(0xFF8aafc4), fontSize: 11)),
              const SizedBox(height: 8),
              Text(c.desc,
                  style: const TextStyle(
                      color: Color(0xFFe8f4f8),
                      fontSize: 13,
                      height: 1.6)),
              const SizedBox(height: 4),
              Text(c.descPt,
                  style: const TextStyle(
                      color: Color(0xFF8aafc4),
                      fontSize: 12,
                      height: 1.5)),
            ],
          ),
        );
      },
    );
  }
}

// ── Flashcards Tab ────────────────────────────────────────────────────────────

class _FlashcardsTab extends StatelessWidget {
  final Module module;
  final int fcIndex;
  final bool fcFlipped;
  final Set<int> known;
  final Set<int> review;
  final void Function(int idx, bool flipped) onNavigate;
  final VoidCallback onKnown;
  final VoidCallback onReview;
  final VoidCallback onFlip;

  const _FlashcardsTab({
    required this.module,
    required this.fcIndex,
    required this.fcFlipped,
    required this.known,
    required this.review,
    required this.onNavigate,
    required this.onKnown,
    required this.onReview,
    required this.onFlip,
  });

  @override
  Widget build(BuildContext context) {
    final cards = module.concepts;
    if (cards.isEmpty) return const SizedBox.shrink();
    final card = cards[fcIndex];

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          // Navigation bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => onNavigate(
                    (fcIndex - 1 + cards.length) % cards.length, false),
                child: const Text('← Prev',
                    style: TextStyle(color: Color(0xFF5DCAA5))),
              ),
              const SizedBox(width: 12),
              Text('${fcIndex + 1} / ${cards.length}',
                  style: const TextStyle(
                      color: Color(0xFF8aafc4), fontSize: 13)),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () =>
                    onNavigate((fcIndex + 1) % cards.length, false),
                child: const Text('Next →',
                    style: TextStyle(color: Color(0xFF5DCAA5))),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Flashcard
          Expanded(
            child: GestureDetector(
              onTap: onFlip,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Container(
                  key: ValueKey(fcFlipped),
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF112240),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: fcFlipped
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(card.pt,
                                style: const TextStyle(
                                    color: Color(0xFF5DCAA5),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                            const SizedBox(height: 12),
                            Text(card.desc,
                                style: const TextStyle(
                                    color: Color(0xFFe8f4f8),
                                    fontSize: 14,
                                    height: 1.5),
                                textAlign: TextAlign.center),
                            const SizedBox(height: 8),
                            Text(card.descPt,
                                style: const TextStyle(
                                    color: Color(0xFF8aafc4),
                                    fontSize: 12,
                                    height: 1.4),
                                textAlign: TextAlign.center),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(card.en,
                                style: const TextStyle(
                                    color: Color(0xFFe8f4f8),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                            const SizedBox(height: 14),
                            const Text('Tap to flip!',
                                style: TextStyle(
                                    color: Color(0xFF5DCAA5),
                                    fontSize: 13)),
                          ],
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onKnown,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1a3358)),
                  child: const Text('✔ I know!',
                      style: TextStyle(color: Color(0xFF5DCAA5))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: onReview,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1a3358)),
                  child: const Text('↩ Review',
                      style: TextStyle(color: Color(0xFF8aafc4))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Status
          Text(
            'Known: ${known.length} | Review: ${review.length}',
            style: const TextStyle(color: Color(0xFF8aafc4), fontSize: 12),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ── Quiz Tab ──────────────────────────────────────────────────────────────────

class _QuizTab extends StatelessWidget {
  final Module module;
  final Map<int, int> quizAnswers;
  final int? quizScore;
  final void Function(int qIdx, int ansIdx) onAnswer;
  final VoidCallback onSubmit;
  final VoidCallback onReset;

  const _QuizTab({
    required this.module,
    required this.quizAnswers,
    required this.quizScore,
    required this.onAnswer,
    required this.onSubmit,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    if (quizScore != null) {
      return _buildResults(context);
    }
    return _buildQuestions(context);
  }

  Widget _buildResults(BuildContext context) {
    final total = module.quiz.length;
    final score = quizScore!;
    final msg = score == total
        ? '🏆 Perfect! (Perfeito!)'
        : score >= total ~/ 2
            ? '👍 Good job! (Bom trabalho!)'
            : '📚 Keep studying! (Continue estudando!)';

    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF112240),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$score/$total',
                style: const TextStyle(
                    color: Color(0xFF5DCAA5),
                    fontSize: 48,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(msg,
                style: const TextStyle(
                    color: Color(0xFFe8f4f8), fontSize: 16),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onReset,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1a3358)),
              child: const Text('Try again (Tentar de novo)',
                  style: TextStyle(color: Color(0xFF5DCAA5))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestions(BuildContext context) {
    final allAnswered = quizAnswers.length == module.quiz.length;

    return ListView.builder(
      padding: const EdgeInsets.all(14),
      itemCount: module.quiz.length + 1,
      itemBuilder: (ctx, i) {
        if (i == module.quiz.length) {
          // Submit button
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: allAnswered ? onSubmit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: allAnswered
                    ? const Color(0xFF5DCAA5)
                    : const Color(0xFF1a3358),
              ),
              child: Text(
                'Submit Quiz (Enviar Respostas)',
                style: TextStyle(
                    color: allAnswered
                        ? const Color(0xFF0d1b2a)
                        : const Color(0xFF8aafc4),
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        }

        final q = module.quiz[i];
        final answered = quizAnswers[i];

        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF112240),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${i + 1}. ${q.q}',
                  style: const TextStyle(
                      color: Color(0xFFe8f4f8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('(${q.qPt})',
                  style: const TextStyle(
                      color: Color(0xFF8aafc4), fontSize: 11)),
              const SizedBox(height: 10),
              ...List.generate(q.opts.length, (j) {
                Color btnColor = const Color(0xFF1a3358);
                if (answered != null) {
                  if (j == q.ans) btnColor = const Color(0xFF5DCAA5);
                  if (answered == j && j != q.ans) {
                    btnColor = const Color(0xFFF0997B);
                  }
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: answered == null
                          ? () => onAnswer(i, j)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                        disabledBackgroundColor: btnColor,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                      ),
                      child: Text(q.opts[j],
                          style: const TextStyle(
                              color: Color(0xFFe8f4f8),
                              fontSize: 13)),
                    ),
                  ),
                );
              }),
              if (answered != null) ...[
                const SizedBox(height: 8),
                Text(
                  answered == q.ans ? '✔ ${q.exp}' : '✗ ${q.exp}',
                  style: TextStyle(
                    color: answered == q.ans
                        ? const Color(0xFF5DCAA5)
                        : const Color(0xFFF0997B),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text('(${q.expPt})',
                    style: const TextStyle(
                        color: Color(0xFF8aafc4), fontSize: 11)),
              ],
            ],
          ),
        );
      },
    );
  }
}

