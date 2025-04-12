import 'package:ecommerce/config/routes/app_routes.dart';
import 'package:ecommerce/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRoutes.profileScreen.name);
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImages.profilePicturePng),
              radius: 20,
            ),
          ),
          Gap(8),
          Expanded(child: Text('Products')),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        Gap(8),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
