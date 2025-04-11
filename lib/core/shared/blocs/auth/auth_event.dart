part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthLoginWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  AuthLoginWithEmailAndPassword({required this.email, required this.password});
}

final class AuthRegisterWithEmailAndPassword extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String photoURL;

  AuthRegisterWithEmailAndPassword({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.photoURL,
  });
}

final class AuthUpdateProfile extends AuthEvent {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? photoURL;

  AuthUpdateProfile({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.photoURL,
  });
}

final class AuthLogout extends AuthEvent {}
