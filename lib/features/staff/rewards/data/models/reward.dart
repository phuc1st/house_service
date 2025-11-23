class Reward {
  const Reward({
    required this.date,
    required this.countdown,
    required this.title,
    required this.description,
    required this.accumulatedValue,
    this.progressMin,
    this.progressCurrent,
    this.progressMax,
  });

  final String date;
  final String countdown;
  final String title;
  final String description;
  final int accumulatedValue;
  final int? progressMin;
  final int? progressCurrent;
  final int? progressMax;

  bool get hasProgress => progressMin != null && progressCurrent != null && progressMax != null;
}

