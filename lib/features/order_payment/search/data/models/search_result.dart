class SearchResult {
  final String id;
  final String providerName;
  final String serviceName;
  final String imageUrl;
  final double rating;
  final int jobCount;
  final int experienceYears;
  final bool isVerified;
  final bool isAvailable;
  final double pricePerHour;
  final String location;

  SearchResult({
    required this.id,
    required this.providerName,
    required this.serviceName,
    required this.imageUrl,
    required this.rating,
    required this.jobCount,
    required this.experienceYears,
    required this.isVerified,
    required this.isAvailable,
    required this.pricePerHour,
    required this.location,
  });
}
