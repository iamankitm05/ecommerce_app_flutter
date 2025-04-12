import 'package:ecommerce/core/constants/app_images.dart';

enum WalkThroughScreenContents {
  firstSlide(
    title: 'Shop the Latest Trends',
    description:
        'Discover a world of fashion, gadgets, and more — all in one place. Stay updated with new arrivals and exclusive collections, handpicked just for you.',
    imagePath: AppImages.shoppingBagPng,
  ),
  secondSlide(
    title: 'Deals You Can’t Resist',
    description:
        'Get access to exclusive discounts, flash sales, and seasonal offers every day. Save more while you shop smarter!',
    imagePath: AppImages.headphonePng,
  ),
  thirdSlide(
    title: 'Fast & Secure Checkout',
    description:
        'Shop with confidence using our encrypted, safe, and one-click checkout process. Your data and purchases are protected.',
    imagePath: AppImages.secureCardPng,
  ),
  fourthSlide(
    title: 'Track Your Orders Easily',
    description:
        'Get real-time order updates from checkout to delivery — so you always know when your favorites are arriving!',
    imagePath: AppImages.fastCheckoutPng,
  );

  final String title;
  final String description;
  final String imagePath;

  const WalkThroughScreenContents({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
