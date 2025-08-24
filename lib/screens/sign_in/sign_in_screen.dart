import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/widgets/my_text_form_field.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_images.dart';
import 'package:ecommerce_app/utils/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Form(
        key: form,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Gap(30),
              Image.asset(AppImages.appIconPng, height: 120, width: 120),
              Gap(30),
              MyTextFormField(
                controller: email,
                hintText: 'Email',
                validator: FormValidator.emailField,
              ),
              Gap(20),
              ValueListenableBuilder(
                valueListenable: obscureTextNotifier,
                builder: (context, value, child) {
                  return MyTextFormField(
                    controller: password,
                    obscureText: value,
                    hintText: 'Password',
                    validator: FormValidator.requiredField,
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureTextNotifier.value = !value;
                      },
                      icon: Icon(
                        value ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  );
                },
              ),
              Gap(8),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    context.pushNamed(AppRoutes.forgetPasswordScreen.name);
                  },
                  child: Text(
                    'Forget Password',
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColors.deepPurple,
                    ),
                  ),
                ),
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
                child: Text('Sign in'),
              ),
              Gap(8),
              Row(
                children: [
                  Text(
                    ' Don\'t have an account? ',
                    style: textTheme.bodyMedium,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.signUpScreen.name);
                    },
                    child: Text(
                      'Sign up',
                      style: textTheme.labelLarge?.copyWith(
                        color: AppColors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(30),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Text(' or '),
                  Expanded(child: Divider()),
                ],
              ),
              Gap(30),
              OutlinedButton.icon(
                onPressed: _signInWithGoogle,
                style: OutlinedButton.styleFrom(minimumSize: Size(140, 55)),
                icon: SvgPicture.asset(
                  AppImages.googleIconSvg,
                  width: 24,
                  height: 24,
                ),
                label: Text('Sign in Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final form = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final obscureTextNotifier = ValueNotifier(false);

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    obscureTextNotifier.dispose();
    super.dispose();
  }

  void _signInWithGoogle() async {
    context.goNamed(AppRoutes.homeScreen.name);
  }
}
