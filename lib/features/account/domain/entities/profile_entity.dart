class ProfileEntity {
  ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;
}
