import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeBottomNavbar extends StatelessWidget {
  const HomeBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      height: kBottomNavigationBarHeight,
      child: Row(
        children: [
          _NavbarItem(
            label: 'Home',
            iconData: Icons.home,
            onTap: () {
              //...
            },
          ),
          _NavbarItem(
            label: 'Cart',
            iconData: Icons.shopping_cart,
            onTap: () {
              //...
            },
          ),
          _NavbarItem(
            label: 'Orders',
            iconData: Icons.receipt_long,
            onTap: () {
              //...
            },
          ),
          _NavbarItem(
            label: 'Menu',
            iconData: Icons.menu,
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
    );
  }
}

class _NavbarItem extends StatelessWidget {
  const _NavbarItem({
    required this.label,
    required this.iconData,
    required this.onTap,
  });

  final String label;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: AppColors.white),
            Text(label, style: TextStyle(color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}
