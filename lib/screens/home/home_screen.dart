import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 10,
          children: [
            Image.asset(AppImages.appIconPng, width: 50, height: 50),
            Expanded(child: Text('My Commerce')),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          Gap(6),
        ],
      ),
      body: MasonryGridView.extent(
        maxCrossAxisExtent: 190,
        padding: EdgeInsets.all(8),
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return Card(
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.productDetailsScreen.name,
                      extra: product,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          product.image,
                          height: 150,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                        Gap(8),
                        Text(
                          product.name,
                          style: textTheme.titleMedium,
                          maxLines: 2,
                        ),
                        Gap(4),
                        Text(
                          product.description,
                          style: textTheme.bodySmall,
                          maxLines: 2,
                        ),
                        Gap(4),
                        Row(
                          children: [
                            Text(
                              '\$${product.price}',
                              style: textTheme.titleLarge,
                              maxLines: 2,
                            ),
                            Card(
                              color: AppColors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  '%${product.discount} off',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: AppColors.white,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 6,
                  right: 6,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.deepPurple,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          if (value == 0) {
            context.goNamed(AppRoutes.wishlistScreen.name);
          } else if (value == 1) {
            context.goNamed(AppRoutes.cartScreen.name);
          } else if (value == 2) {
            context.goNamed(AppRoutes.orderHistoryScreen.name);
          } else if (value == 3) {
            context.goNamed(AppRoutes.profileScreen.name);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
