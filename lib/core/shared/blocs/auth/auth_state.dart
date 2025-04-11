part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

sealed class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated(this.user);
}

final class AuthAuthenticatedLoading extends AuthAuthenticated {
  const AuthAuthenticatedLoading(super.user);
}

final class AuthLoggedIn extends AuthAuthenticated {
  const AuthLoggedIn(super.user);
}

final class AuthProfileUpdated extends AuthAuthenticated {
  const AuthProfileUpdated(super.user);
}

final class AuthAuthenticatedFailure extends AuthAuthenticated {
  final String error;

  const AuthAuthenticatedFailure(super.user, {required this.error});
}

sealed class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

final class AuthUnauthenticatedLoading extends AuthUnauthenticated {
  const AuthUnauthenticatedLoading();
}

final class AuthInitial extends AuthUnauthenticated {
  const AuthInitial();
}

final class AuthLoggedOut extends AuthUnauthenticated {
  const AuthLoggedOut();
}

final class AuthUnauthenticatedSuccess extends AuthUnauthenticated {
  final String message;
  const AuthUnauthenticatedSuccess(this.message);
}

final class AuthUnauthenticatedFailure extends AuthUnauthenticated {
  final String error;
  const AuthUnauthenticatedFailure(this.error);
}
