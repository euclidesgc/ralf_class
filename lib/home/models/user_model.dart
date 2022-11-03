class UserModel {
  final int id;
  final String name;
  final String email;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, avatarUrl: $avatarUrl)';
  }
}
