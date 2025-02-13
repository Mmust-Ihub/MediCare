class Staff {
  final String id;
  final String name;
  final String role;
  final String specialization;
  final String email;
  final String phone;
  final String imageUrl;
  final bool isOnShift;

  Staff({
    required this.id,
    required this.name,
    required this.role,
    required this.specialization,
    required this.email,
    required this.phone,
    required this.imageUrl,
    this.isOnShift = false,
  });
}