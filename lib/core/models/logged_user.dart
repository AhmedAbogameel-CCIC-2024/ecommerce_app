class LoggedUser {
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;

  LoggedUser({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      id: json['id'],
      image: json['image'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "id": id,
      "image": image,
      "token": token,
    };
  }
}
