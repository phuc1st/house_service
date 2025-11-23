class SettingsData {
  String name;
  String email;
  String phone;
  bool pushEnabled;
  bool emailEnabled;
  bool smsEnabled;
  List<String> paymentMethods;
  List<String> addresses;
  bool darkMode;

  SettingsData({
    required this.name,
    required this.email,
    required this.phone,
    this.pushEnabled = false,
    this.emailEnabled = false,
    this.smsEnabled = false,
    List<String>? paymentMethods,
    List<String>? addresses,
    this.darkMode = false,
  })  : paymentMethods = paymentMethods ?? [],
        addresses = addresses ?? [];

  SettingsData copyWith({
    String? name,
    String? email,
    String? phone,
    bool? pushEnabled,
    bool? emailEnabled,
    bool? smsEnabled,
    List<String>? paymentMethods,
    List<String>? addresses,
    bool? darkMode,
  }) {
    return SettingsData(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      pushEnabled: pushEnabled ?? this.pushEnabled,
      emailEnabled: emailEnabled ?? this.emailEnabled,
      smsEnabled: smsEnabled ?? this.smsEnabled,
      paymentMethods: paymentMethods ?? List.from(this.paymentMethods),
      addresses: addresses ?? List.from(this.addresses),
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
