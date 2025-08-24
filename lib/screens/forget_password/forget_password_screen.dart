import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utils/app_images.dart';
import 'package:ecommerce_app/utils/form_validator.dart';
import 'package:ecommerce_app/widgets/my_text_form_field.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget Password')),
      body: Form(
        key: form,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Gap(20),
              SvgPicture.asset(
                AppImages.forgotPasswordNttjSvg,
                fit: BoxFit.fitHeight,
                height: 200,
              ),
              Gap(30),
              MyTextFormField(
                controller: email,
                hintText: 'Email',
                validator: FormValidator.emailField,
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
                child: Text('Send verification link'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final form = GlobalKey<FormState>();
  final email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
