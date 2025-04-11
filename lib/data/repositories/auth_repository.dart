import 'package:ecommerce/core/enums/sign_in_method.dart';
import 'package:ecommerce/data/models/user/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  AuthRepository();

  Future<Either<String, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    if (email == "error@gmail.com" && password == "123456") {
      return left("Invalid credential!");
    }

    return right(
      User(
        signInMethod: SignInMethod.emailAndPassword,
        firstName: 'Test',
        email: email,
        password: password,
        photoURL:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB4-Xrh60sWg56uDxweYNdEfZWBdOTRaiLMlnboLlkNgiZXiU7hN9ke4cBFdnVB04-CmU&usqp=CAU',
      ),
    );
  }

  Future<Either<String, User>> registerWithEmailAndPassword({
    required String lastName,
    required String firstName,
    required String email,
    required String password,
    required String photoURL,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    if (email == "error@gmail.com" && password == "123456") {
      return left("Unexpected error occurred!");
    }

    return right(
      User(
        signInMethod: SignInMethod.emailAndPassword,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        photoURL: photoURL,
      ),
    );
  }

  Future<Either<String, User>> updateProfile({
    required String? lastName,
    required String? firstName,
    required String? email,
    required String? password,
    required String? photoURL,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    if (email == "error@gmail.com" && password == "123456") {
      return left("Unexpected error occurred!");
    }

    return right(
      User(
        signInMethod: SignInMethod.emailAndPassword,
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        email: email ?? '',
        password: password ?? '',
        photoURL: photoURL ?? '',
      ),
    );
  }

  Future<Either<String, String>> logout(SignInMethod signInMethod) async {
    try {
      (await SharedPreferences.getInstance()).clear();
      return right('logged out successfully!');
    } catch (_) {
      return left('Unexpected error occurred!');
    }
  }
}
