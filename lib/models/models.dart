class Module {
  final String id;
  final String title;
  final String pt;
  final String icon;
  final String color;
  final List<Concept> concepts;
  final List<Question> quiz;

  const Module({
    required this.id,
    required this.title,
    required this.pt,
    required this.icon,
    required this.color,
    required this.concepts,
    required this.quiz,
  });
}

class Concept {
  final String en;
  final String pt;
  final String desc;
  final String descPt;
  final String? svg;

  const Concept({
    required this.en,
    required this.pt,
    required this.desc,
    required this.descPt,
    this.svg,
  });
}

class Question {
  final String q;
  final String qPt;
  final List<String> opts;
  final int ans;
  final String exp;
  final String expPt;

  const Question({
    required this.q,
    required this.qPt,
    required this.opts,
    required this.ans,
    required this.exp,
    required this.expPt,
  });
}

class GameZone {
  final String id;
  final String name;
  final String pt;
  final String intro;
  final String introPt;
  final String svgId;
  final String q;
  final String qPt;
  final List<String> opts;
  final int ans;
  final String feedback;
  final String feedbackPt;
  final String evidenceItem;

  const GameZone({
    required this.id,
    required this.name,
    required this.pt,
    required this.intro,
    required this.introPt,
    required this.svgId,
    required this.q,
    required this.qPt,
    required this.opts,
    required this.ans,
    required this.feedback,
    required this.feedbackPt,
    required this.evidenceItem,
  });
}

class GlossaryEntry {
  final String en;
  final String pt;
  final String def;

  const GlossaryEntry(this.en, this.pt, this.def);
}

