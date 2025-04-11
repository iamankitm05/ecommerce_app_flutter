import 'package:freezed_annotation/freezed_annotation.dart';

enum SignInMethod {
  emailAndPassword(label: "Email & Password", value: "emailAndPassword"),
  google(label: "Google", value: "google"),
  facebook(label: "facebook", value: "facebook"),
  apple(label: "Apple", value: "apple");

  final String value;
  final String label;

  const SignInMethod({required this.value, required this.label});
}

class SignInMethodConverter implements JsonConverter<SignInMethod, String> {
  const SignInMethodConverter();

  @override
  SignInMethod fromJson(String json) {
    return SignInMethod.values.firstWhere(
      (e) => e.value == json,
      // orElse: () => SignInMethod.emailAndPassword,
    );
  }

  @override
  String toJson(SignInMethod object) => object.value;
}
