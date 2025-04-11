import 'package:ecommerce/core/shared/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/shared/widgets/outline_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      //...
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              OutlineTextFormField(controller: email, labelText: 'Email'),
              Gap(20),
              OutlineTextFormField(
                controller: password,
                labelText: 'Password',
                obscureText: passwordObscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordObscureText = !passwordObscureText;
                    });
                  },
                  icon: Icon(
                    passwordObscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              Gap(20),
              OutlineTextFormField(
                controller: confirmPassword,
                labelText: 'Confirm Password',
                obscureText: confirmPasswordObscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      confirmPasswordObscureText = !confirmPasswordObscureText;
                    });
                  },
                  icon: Icon(
                    confirmPasswordObscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              Gap(20),
              CustomElevatedButton(
                onPressed: () {},
                //...
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool passwordObscureText = true;
  bool confirmPasswordObscureText = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
