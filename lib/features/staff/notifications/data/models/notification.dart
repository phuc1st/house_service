class Notification {
  const Notification({
    required this.id,
    required this.title,
    required this.description,
    this.isRead = false,
    this.createdAt,
  });

  final String id;
  final String title;
  final String description;
  final bool isRead;
  final DateTime? createdAt;
}

