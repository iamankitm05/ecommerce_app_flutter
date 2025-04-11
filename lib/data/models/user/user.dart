import 'package:ecommerce/core/enums/sign_in_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default("") String id,
    @Default("") String firstName,
    @Default("") String lastName,
    @Default("") String password,
    @Default("") String email,
    @Default("") String photoURL,
    @SignInMethodConverter() required SignInMethod signInMethod,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
