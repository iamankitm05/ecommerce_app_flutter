import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 280,
        childAspectRatio: 8 / 12,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 15,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.secondary,
          highlightColor: Theme.of(
            context,
          ).colorScheme.secondary.withAlpha(150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: Container(color: AppColors.amber),
              ),
              Gap(12),
              Container(color: AppColors.amber, height: 8),
              Gap(6),
              Container(color: AppColors.amber, height: 8),
              Gap(6),
              Container(color: AppColors.amber, height: 8, width: 90),
              Gap(6),
              Container(color: AppColors.amber, height: 8, width: 120),
              Gap(6),
            ],
          ),
        );
      },
    );
  }
}
