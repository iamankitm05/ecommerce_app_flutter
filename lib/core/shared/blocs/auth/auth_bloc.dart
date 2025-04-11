import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/data/models/user/user.dart';
import 'package:ecommerce/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  static Future<AuthBloc> init(AuthRepository authRepository) async {
    final user = null;
    if (user != null) {
      return AuthBloc(AuthLoggedIn(user), authRepository);
    } else {
      return AuthBloc(AuthInitial(), authRepository);
    }
  }

  bool get isAuthenticated {
    return state is AuthAuthenticated;
  }

  User? get currentUser {
    if (state is AuthAuthenticated) {
      return (state as AuthAuthenticated).user;
    }

    return null;
  }

  AuthBloc(super.initialState, this._authRepository) {
    on<AuthLoginWithEmailAndPassword>(_authLoginWithEmailAndPassword);
    on<AuthRegisterWithEmailAndPassword>(_authRegisterWithEmailAndPassword);
    on<AuthUpdateProfile>(_authUpdateProfile);
    on<AuthLogout>(_authLogout);
  }

  FutureOr<void> _authLoginWithEmailAndPassword(
    AuthLoginWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthUnauthenticatedLoading) return;
    emit(AuthUnauthenticatedLoading());

    final res = await _authRepository.loginWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    res.fold(
      (error) => emit(AuthUnauthenticatedFailure(error)),
      (user) => emit(AuthLoggedIn(user)),
    );
  }

  FutureOr<void> _authRegisterWithEmailAndPassword(
    AuthRegisterWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthUnauthenticatedLoading) return;
    emit(AuthUnauthenticatedLoading());

    final res = await _authRepository.registerWithEmailAndPassword(
      email: event.email,
      password: event.password,
      lastName: event.lastName,
      firstName: event.firstName,
      photoURL: event.photoURL,
    );

    res.fold(
      (error) => emit(AuthUnauthenticatedFailure(error)),
      (user) => emit(AuthLoggedIn(user)),
    );
  }

  FutureOr<void> _authUpdateProfile(
    AuthUpdateProfile event,
    Emitter<AuthState> emit,
  ) async {
    final authState = state;
    if (authState is! AuthAuthenticated ||
        authState is AuthAuthenticatedLoading) {
      return;
    }
    emit(AuthAuthenticatedLoading(authState.user));
    final res = await _authRepository.updateProfile(
      email: event.email,
      password: event.password,
      lastName: event.lastName,
      firstName: event.firstName,
      photoURL: event.photoURL,
    );

    res.fold(
      (error) => emit(AuthAuthenticatedFailure(authState.user, error: error)),
      (user) => emit(AuthProfileUpdated(user)),
    );
  }

  FutureOr<void> _authLogout(AuthLogout event, Emitter<AuthState> emit) async {
    final authState = state;
    if (authState is! AuthAuthenticated ||
        authState is AuthAuthenticatedLoading) {
      return;
    }
    final res = await _authRepository.logout(authState.user.signInMethod);
    res.fold(
      (error) => emit(AuthAuthenticatedFailure(authState.user, error: error)),
      (message) => emit(AuthLoggedOut()),
    );
  }
}
