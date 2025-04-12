import 'package:ecommerce/config/routes/app_routes.dart';
import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/config/theme/cubit/app_theme_cubit.dart';
import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/shared/blocs/auth/auth_bloc.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = getIt<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (context, authState) {
        final isAuthenticated = authBloc.isAuthenticated;
        final buttonStyle = OutlinedButton.styleFrom(
          foregroundColor: AppColors.white,
          side: BorderSide(color: AppColors.white),
        );
        return Drawer(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: AppColors.primary),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoutes.profileScreen.name);
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(AppImages.profilePicturePng),
                  ),
                ),
                otherAccountsPictures: [
                  IconButton(
                    onPressed: () {
                      authBloc.add(AuthLogout());
                    },
                    color: AppColors.white,
                    icon: Icon(Icons.logout),
                  ),
                ],
                accountName: isAuthenticated ? Text('') : SizedBox(),
                accountEmail:
                    isAuthenticated
                        ? Text('')
                        : Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                context.pushNamed(AppRoutes.loginScreen.name);
                              },
                              style: buttonStyle,
                              child: Text('Login'),
                            ),
                            Gap(8),
                            OutlinedButton(
                              onPressed: () {
                                context.pushNamed(AppRoutes.signUpScreen.name);
                              },
                              style: buttonStyle,
                              child: Text('Register'),
                            ),
                          ],
                        ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: AppColors.deepOrange),
                      onTap: () {},
                      title: Text('Profile'),
                    ),
                    ListTile(
                      leading: Icon(Icons.color_lens, color: AppColors.blue),
                      onTap: () {
                        context.pop();
                        showThemeChangeDialog(context);
                      },
                      title: Text('Theme'),
                    ),
                    ListTile(
                      leading: Icon(Icons.info, color: AppColors.green),
                      onTap: () {
                        showAboutDialog(context: context);
                      },
                      title: Text('About'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showThemeChangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final appThemeCubit = getIt<AppThemeCubit>();
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text('Select Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  appThemeCubit.changeTheme(ThemeMode.system);
                  context.pop();
                },
                child: Text('System'),
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  appThemeCubit.changeTheme(ThemeMode.dark);
                  context.pop();
                },
                child: Text('Dark'),
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  appThemeCubit.changeTheme(ThemeMode.light);
                  context.pop();
                },
                child: Text('Light'),
              ),
            ],
          ),
        );
      },
    );
  }
}
