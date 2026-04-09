class AuthParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  final String? otp;

  AuthParams({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.otp,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
  };

  @override
  String toString() {
    return "name,$name email,$email password,$password passwordConfirmation,$passwordConfirmation";
  }
}
