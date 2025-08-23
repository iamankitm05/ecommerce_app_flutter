import 'package:ecommerce_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  @override
  Widget build(BuildContext context) {
    final walkThroughScreenData = WalkThroughScreenData.values;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: () {}, child: Text('Skip'))],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: walkThroughScreenData.length,
              itemBuilder: (context, index) {
                final title = walkThroughScreenData[index].title;
                final description = walkThroughScreenData[index].description;
                final imagePath = walkThroughScreenData[index].imagePath;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset(imagePath)),
                    Gap(8),
                    Text(title, style: textTheme.titleLarge),
                    Gap(8),
                    Text(description, style: textTheme.bodyMedium),
                    Gap(8),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 4,
                  // axisDirection:,
                  // textDirection:,
                  // onDotClicked:,
                  // effect: ,
                ),
                Gap(8),
                ElevatedButton(onPressed: () {}, child: Text('Next')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final pageController = PageController();
}

enum WalkThroughScreenData {
  exploreProducts(
    title: 'Discover Trendy Products',
    description: 'Browse a wide range of products tailored just for you.',
    imagePath: AppImages.shoppingAppB80fSvg,
  ),
  easySecureShopping(
    title: 'Easy & Secure Shopping',
    description: 'Enjoy seamless payments with 100% data security.',
    imagePath: AppImages.creditCardPaymentsY0vnSvg,
  ),
  fastDelivery(
    title: 'Quick Delivery at Your Doorstep',
    description: 'Get your orders delivered safely and on time.',
    imagePath: AppImages.onTheWayAhi2Svg,
  ),
  personalizedExperience(
    title: 'Smart Recommendations for You',
    description: 'We personalize your feed to match your style.',
    imagePath: AppImages.productExplainerB7ftSvg,
  );

  final String title;
  final String description;
  final String imagePath;

  const WalkThroughScreenData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
