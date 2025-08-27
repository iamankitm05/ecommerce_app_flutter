import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text('Details')),

      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepPurple,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Add to card'),
            ),
          ),
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(),
                side: BorderSide(color: AppColors.deepPurple),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Buy'),
            ),
          ),
        ],
      ),

      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                product.image,
                height: 350,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              Positioned(
                top: 20,
                right: 20,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: textTheme.titleLarge),
                Gap(6),
                Text(product.description, style: textTheme.bodyMedium),
                Gap(10),
                Row(
                  spacing: 4,
                  children: [
                    Text("\$${product.price}", style: textTheme.titleLarge),
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

                Gap(26),
                Text('Details', style: textTheme.titleLarge),
                Divider(color: colorScheme.onSurface, endIndent: 200),
                ...product.features.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Gap(10),
                        Icon(Icons.circle, size: 12),
                        Gap(10),
                        Text(e, style: textTheme.bodyMedium),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
