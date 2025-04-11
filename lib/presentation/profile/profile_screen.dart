import 'package:ecommerce/core/shared/blocs/auth/auth_bloc.dart';
import 'package:ecommerce/core/shared/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/shared/widgets/outline_text_form_field.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:ecommerce/presentation/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = ProfileCubit(getIt<AuthBloc>().currentUser!);
    return BlocProvider(
      create: (context) => profileCubit,
      child: Scaffold(
        appBar: AppBar(title: Text('Profile')),

        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return SizedBox.expand(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          state is ProfilePictureSelected
                              ? MemoryImage(state.profilePictureData)
                              : NetworkImage(profileCubit.photoURL),
                      onBackgroundImageError: (exception, stackTrace) {},
                      child:
                          state is ProfileEditable
                              ? IconButton(
                                onPressed: profileCubit.selectProfilePicture,
                                icon: Icon(Icons.camera_alt_outlined, size: 40),
                              )
                              : null,
                    ),
                    Gap(40),
                    Row(
                      children: [
                        Expanded(
                          child: OutlineTextFormField(
                            controller: profileCubit.firstName,
                            labelText: 'First Name',
                            enabled: state is ProfileEditable,
                          ),
                        ),
                        Gap(8),
                        Expanded(
                          child: OutlineTextFormField(
                            controller: profileCubit.lastName,
                            labelText: 'Last Name',
                            enabled: state is ProfileEditable,
                          ),
                        ),
                      ],
                    ),

                    Gap(20),
                    OutlineTextFormField(
                      controller: profileCubit.email,
                      labelText: 'Email',
                      enabled: state is ProfileEditable,
                    ),
                    Gap(20),
                    if (state is ProfileEditable) ...[
                      CustomElevatedButton(
                        onPressed: () {
                          //..
                        },
                        child: Text('Save'),
                      ),
                      Gap(20),
                      OutlinedButton(
                        onPressed: profileCubit.makeProfileNotEditable,
                        child: Text('Cancel'),
                      ),
                    ] else
                      CustomElevatedButton(
                        onPressed: profileCubit.makeProfileEditable,
                        child: Text('Edit'),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
