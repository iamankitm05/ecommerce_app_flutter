import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utils/form_validator.dart';
import 'package:ecommerce_app/widgets/my_text_form_field.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepPurple,
        foregroundColor: AppColors.white,
        title: Text('Sign up'),
      ),
      body: Form(
        key: form,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: MyTextFormField(
                      controller: firstName,
                      hintText: 'First Name',
                      validator: FormValidator.requiredField,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      controller: lastName,
                      hintText: 'Last Name',
                      validator: FormValidator.requiredField,
                    ),
                  ),
                ],
              ),
              Gap(20),
              MyTextFormField(
                controller: phoneNumber,
                hintText: 'Phone Number',
                validator: FormValidator.requiredField,
              ),
              Gap(20),
              MyTextFormField(
                controller: email,
                hintText: 'Email',
                validator: FormValidator.emailField,
              ),
              Gap(20),
              ValueListenableBuilder(
                valueListenable: passwordObscureText,
                builder: (context, value, child) {
                  return MyTextFormField(
                    controller: password,
                    obscureText: value,
                    hintText: 'Password',
                    validator: FormValidator.requiredField,
                    suffixIcon: IconButton(
                      onPressed: () {
                        passwordObscureText.value = !value;
                      },
                      icon: Icon(
                        value ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  );
                },
              ),
              Gap(20),
              ValueListenableBuilder(
                valueListenable: confirmPasswordObscureText,
                builder: (context, value, child) {
                  return MyTextFormField(
                    controller: password,
                    obscureText: value,
                    hintText: 'Confirm Password',
                    validator: (value) {
                      final error = FormValidator.passwordField(value);
                      if (error != null) {
                        return error;
                      }

                      if (value!.compareTo(password.text) != 0) {
                        return 'Password does not match.';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        confirmPasswordObscureText.value = !value;
                      },
                      icon: Icon(
                        value ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  );
                },
              ),
              Gap(20),
              ElevatedButton(
                onPressed: () {
                  if (!(form.currentState?.validate() ?? false)) return;
                  context.goNamed(AppRoutes.homeScreen.name);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepPurple,
                  foregroundColor: AppColors.white,
                  minimumSize: Size(140, 55),
                ),
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final form = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final passwordObscureText = ValueNotifier(false);
  final confirmPasswordObscureText = ValueNotifier(false);

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    passwordObscureText.dispose();
    confirmPasswordObscureText.dispose();
    super.dispose();
  }
}
