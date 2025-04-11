import 'package:ecommerce/config/routes/app_routes.dart';
import 'package:ecommerce/core/shared/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: (currentSlide - 1) * (1 / maxSlide),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CustomElevatedButton(
                        onPressed: () {
                          context.goNamed(AppRoutes.loginScreen.name);
                        },
                        height: 35,
                        width: 80,
                        borderRadius: 100,
                        child: Text('Skip'),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    currentSlide.toString(),
                    style: TextStyle(fontSize: 120),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () => updateSlide(-1),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                Gap(8),
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () => updateSlide(1),
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int currentSlide = 1;
  final maxSlide = 3;

  void updateSlide(int value) {
    currentSlide += value;
    if (currentSlide < 0) {
      currentSlide = 0;
    } else if (currentSlide > maxSlide) {
      context.goNamed(AppRoutes.loginScreen.name);
    }
    setState(() {});
  }
}
