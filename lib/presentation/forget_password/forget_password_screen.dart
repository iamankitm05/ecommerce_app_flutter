import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/core/shared/blocs/auth/auth_bloc.dart';
import 'package:ecommerce/core/shared/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/shared/widgets/outline_text_form_field.dart';
import 'package:ecommerce/core/utils/custom_toast.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
      //...
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthUnauthenticatedSuccess) {
            CustomToast.success(message: state.message);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                OutlineTextFormField(controller: email, labelText: 'Email'),
                Gap(20),
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: authBloc,
                  builder: (context, state) {
                    return CustomElevatedButton(
                      onPressed: () {},
                      child:
                          state is AuthUnauthenticatedLoading
                              ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              )
                              : Text('Send'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final email = TextEditingController();
  final authBloc = getIt<AuthBloc>();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
