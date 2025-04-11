import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/core/shared/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationExample extends StatelessWidget {
  const NotificationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomElevatedButton(
              backgroundColor: AppColors.green,
              onPressed: () {
                CustomToast.success(message: 'Success');
              },
              child: Text('Success'),
            ),
            Gap(20),
            CustomElevatedButton(
              onPressed: () {
                CustomToast.info(message: 'Info');
              },
              backgroundColor: AppColors.blue,
              child: Text('Info'),
            ),
            Gap(20),
            Gap(20),
            CustomElevatedButton(
              onPressed: () {
                CustomToast.error(message: 'Error');
              },
              backgroundColor: AppColors.red,
              child: Text('Error'),
            ),
            Gap(20),
            CustomElevatedButton(
              onPressed: () {
                CustomToast.warning(message: 'Warning');
              },
              backgroundColor: AppColors.amber,
              child: Text('Warning'),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
