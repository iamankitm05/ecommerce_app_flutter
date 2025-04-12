import 'package:ecommerce/config/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/presentation/walk_through/walk_through_screen_contents.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkThroughScreen extends StatelessWidget {
  const WalkThroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walkThroughScreenContents = WalkThroughScreenContents.values;
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: walkThroughScreenContents.length,
                  itemBuilder: (BuildContext context, int index) {
                    final walkThroughScreenContent =
                        walkThroughScreenContents[index];
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            walkThroughScreenContent.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Gap(20),
                        Text(
                          walkThroughScreenContent.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Gap(8),
                        Text(
                          walkThroughScreenContent.description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Gap(20),
                        if (walkThroughScreenContents.length == index + 1)
                          ElevatedButton(
                            onPressed: () {
                              context.goNamed(AppRoutes.loginScreen.name);
                            },
                            child: Text('Continue'),
                          ),
                      ],
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: walkThroughScreenContents.length,
                effect: WormEffect(
                  dotColor: AppColors.primary,
                  paintStyle: PaintingStyle.stroke,
                  activeDotColor: AppColors.primary,
                  strokeWidth: 2,
                  dotWidth: 8,
                  dotHeight: 8,
                ),
              ),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }

  static final pageController = PageController();
}
