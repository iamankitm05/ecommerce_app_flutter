import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';

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
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoutes.signInScreen.name);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.deepPurple,
            ),
            child: Text('Skip'),
          ),
          Gap(16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: pageController,
              itemCount: walkThroughScreenData.length,
              itemBuilder: (context, index) {
                final title = walkThroughScreenData[index].title;
                final description = walkThroughScreenData[index].description;
                final imagePath = walkThroughScreenData[index].imagePath;

                return Padding(
                  padding: const EdgeInsets.all(26),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: SvgPicture.asset(imagePath)),
                      Gap(25),
                      Text(
                        title,
                        style: textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      Gap(8),
                      Text(
                        description,
                        style: textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      Gap(8),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 4,
                  effect: WormEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    dotColor: colorScheme.onSurface,
                    activeDotColor: primaryColor,
                  ),
                ),
                Gap(20),
                ValueListenableBuilder(
                  valueListenable: walkThroughDoneNotifier,
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (value) {
                          context.goNamed(AppRoutes.signInScreen.name);
                        } else {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(120, 55),
                        backgroundColor: primaryColor,
                        foregroundColor: AppColors.white,
                      ),
                      child: value ? Text('Continue') : Text('Next'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final pageController = PageController();
  final walkThroughDoneNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page?.toInt() ?? 0;
      if (page >= WalkThroughScreenData.values.length - 1) {
        setState(() {
          walkThroughDoneNotifier.value = true;
        });
      } else if (walkThroughDoneNotifier.value) {
        walkThroughDoneNotifier.value = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
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
