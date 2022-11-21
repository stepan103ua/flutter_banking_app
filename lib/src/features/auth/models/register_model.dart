class RegisterModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String ipn;
  final String passportNumber;
  final String password;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.ipn,
    required this.passportNumber,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
      firstName: json['name'],
      lastName: json['surname'],
      phoneNumber: json['phone'],
      ipn: json['ipn'],
      passportNumber: json['passport'],
      password: json['password']);
}
