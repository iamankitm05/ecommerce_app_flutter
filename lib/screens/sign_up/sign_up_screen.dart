import 'package:ecommerce_app/shared/widgets/my_text_form_field.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Gap(30),
            Image.asset(AppImages.appIconPng, height: 120, width: 120),
            Gap(30),
            MyTextFormField(controller: email, hintText: 'Email'),
            Gap(20),
            MyTextFormField(controller: email, hintText: 'Password'),
            Gap(8),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
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
              onPressed: () {},
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
                Text(' Dont have an account? ', style: textTheme.bodyMedium),
                InkWell(
                  onTap: () {},
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
              onPressed: () {},
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
    );
  }

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
