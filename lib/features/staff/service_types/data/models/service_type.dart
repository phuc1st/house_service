class ServiceType {
  const ServiceType({
    required this.id,
    required this.name,
    required this.isEnabled,
  });

  final String id;
  final String name;
  final bool isEnabled;

  ServiceType copyWith({
    String? id,
    String? name,
    bool? isEnabled,
  }) {
    return ServiceType(
      id: id ?? this.id,
      name: name ?? this.name,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}


