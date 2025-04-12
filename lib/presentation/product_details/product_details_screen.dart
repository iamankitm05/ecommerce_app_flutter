import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/data/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(this.product, {super.key});

  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final buttonStyle = OutlinedButton.styleFrom(
      foregroundColor: AppColors.white,
      side: BorderSide(color: AppColors.white),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset(
                    widget.product.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_outline,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList.list(
              children: [
                Text(
                  widget.product.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '${widget.product.price} ${widget.product.rating}% off | rating: ${widget.product.rating}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Gap(2),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: buttonStyle,
                      child: Text('Buy'),
                    ),
                    Gap(8),
                    OutlinedButton(
                      onPressed: () {},
                      style: buttonStyle,
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
                Gap(8),
                Text(
                  widget.product.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isLiked = false;
}
