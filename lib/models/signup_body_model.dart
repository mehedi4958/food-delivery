class SignUpBody {
  SignUpBody({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  final String email;
  final String password;
  final String name;
  final String phone;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['email'] = email;
    data['password'] = password;
    data['f_name'] = name;
    data['phone'] = phone;

    return data;
  }
}
