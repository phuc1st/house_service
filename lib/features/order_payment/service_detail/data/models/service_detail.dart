class ServiceDetail {
  const ServiceDetail({
    required this.providerName,
    required this.serviceType,
    required this.rating,
    required this.jobCount,
    required this.experience,
    required this.price,
    required this.avatarImage,
    required this.description,
    required this.includedServices,
  });

  final String providerName;
  final String serviceType;
  final double rating;
  final int jobCount;
  final String experience;
  final String price;
  final String avatarImage;
  final String description;
  final List<String> includedServices;
}

