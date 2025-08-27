import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_images.dart';
import 'package:ecommerce_app/utils/my_toast.dart';
import 'package:ecommerce_app/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Card(
              child: Image.asset(AppImages.avatarPng, width: 126, height: 126),
            ),
          ),
          Gap(20),
          MyTextFormField(labelText: 'Name', readOnly: !isEnable),
          Gap(20),
          MyTextFormField(labelText: 'Phone Number', readOnly: !isEnable),
          Gap(20),
          MyTextFormField(labelText: 'Email', readOnly: !isEnable),
          Gap(20),
          MyTextFormField(
            labelText: 'Date of Birth',
            hintText: 'DD/MM/YYYY',
            readOnly: !isEnable,
          ),
          Gap(20),
          MyTextFormField(
            labelText: 'Address',
            maxLines: 4,
            readOnly: !isEnable,
          ),
          Gap(20),
          ElevatedButton(
            onPressed: () {
              if (isEnable) {
                MyToast.success('Response saved successfully');
              }
              setState(() {
                isEnable = !isEnable;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deepPurple,
              foregroundColor: AppColors.white,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(isEnable ? 'Save' : 'Edit'),
          ),
        ],
      ),
    );
  }

  bool isEnable = false;
}
