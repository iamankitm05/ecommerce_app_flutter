import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('My Wishlist')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.stepToTheSunWp49Svg, height: 250),
            Gap(50),
            Text(
              'You haven\'t added any product in your Wishlist',
              style: textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Gap(10),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoutes.homeScreen.name);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepPurple,
                foregroundColor: AppColors.white,
              ),
              child: Text('Add now'),
            ),
          ],
        ),
      ),
    );
  }
}
