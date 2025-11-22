class Profile {
  const Profile({
    required this.name,
    required this.occupation,
    required this.hourlyRate,
    required this.rating,
    required this.jobCount,
    required this.avatarImage,
    required this.isAvailable,
    required this.experience,
    required this.isVerified,
    required this.serviceArea,
    required this.introductionImages,
  });

  final String name;
  final String occupation;
  final String hourlyRate;
  final double rating;
  final int jobCount;
  final String avatarImage;
  final bool isAvailable;
  final String experience;
  final bool isVerified;
  final String serviceArea;
  final List<String> introductionImages;
}

