class StaffProfile {
  const StaffProfile({
    required this.name,
    required this.occupation,
    required this.avatarImage,
    required this.phone,
    required this.email,
    required this.address,
    required this.professionalDescription,
    required this.averageRating,
    required this.completedOrders,
    required this.basicPricePerHour,
    required this.startDate,
    required this.skills,
  });

  final String name;
  final String occupation;
  final String avatarImage;
  final String phone;
  final String email;
  final String address;
  final String professionalDescription;
  final double averageRating;
  final int completedOrders;
  final String basicPricePerHour;
  final String startDate;
  final List<String> skills;
}


