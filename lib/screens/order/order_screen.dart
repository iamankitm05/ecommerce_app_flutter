import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Past Order')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.emptyCart574uSvg, height: 250),
            Gap(50),
            Text(
              'You haven\'t buy any product yet, shop now',
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
              child: Text('Find more deals'),
            ),
          ],
        ),
      ),
    );
  }
}
