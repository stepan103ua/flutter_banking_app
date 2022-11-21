class LoginModel {
  final String login;
  final String password;

  LoginModel({required this.login, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        login: json['login'],
        password: json['password'],
      );
}
