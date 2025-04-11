import 'package:ecommerce/config/routes/app_routes.dart';
import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/core/shared/blocs/auth/auth_bloc.dart';
import 'package:ecommerce/core/shared/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/shared/widgets/outline_text_form_field.dart';
import 'package:ecommerce/core/utils/custom_toast.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      //...
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.goNamed(AppRoutes.homeScreen.name);
          } else if (state is AuthUnauthenticatedFailure) {
            CustomToast.error(message: state.error);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                OutlineTextFormField(controller: email, labelText: 'Email'),
                Gap(20),
                OutlineTextFormField(
                  controller: password,
                  labelText: 'Password',
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pushNamed(AppRoutes.signUpScreen.name);
                      },
                      child: Text('Sign up'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(AppRoutes.forgetPasswordScreen.name);
                      },
                      child: Text('Forget Password'),
                    ),
                  ],
                ),
                Gap(20),
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: authBloc,
                  builder: (context, state) {
                    return CustomElevatedButton(
                      onPressed: () {
                        authBloc.add(
                          AuthLoginWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          ),
                        );
                      },
                      //...
                      child:
                          state is AuthUnauthenticatedLoading
                              ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              )
                              : Text('Login'),
                    );
                  },
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final email = TextEditingController();
  final password = TextEditingController();

  final authBloc = getIt<AuthBloc>();

  bool obscureText = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
