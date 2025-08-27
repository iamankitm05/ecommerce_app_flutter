import 'package:ecommerce_app/utils/app_images.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String image;
  final String name;
  final double price;
  final double discount;
  final String description;
  final List<String> features;

  double get newPrice {
    return price * (100 - discount) / 100;
  }

  const Product({
    required this.image,
    required this.name,
    required this.price,
    required this.discount,
    required this.description,
    required this.features,
  });

  @override
  List<Object> get props {
    return [image, name, price, discount, description, features];
  }
}

final dummyProducts = List<Product>.unmodifiable([
  Product(
    image: AppImages.laptop1Png,
    name: "MacBook Pro",
    price: 1500,
    discount: 10,
    description: "Apple MacBook Pro with M1 chip for powerful performance.",
    features: ["M1 Chip", "16GB RAM", "512GB SSD", "Retina Display"],
  ),
  Product(
    image: AppImages.iphone1Png,
    name: "iPhone 14",
    price: 999,
    discount: 5,
    description: "Apple iPhone 14 with advanced dual-camera system.",
    features: ["A15 Bionic", "128GB Storage", "5G Support", "Super Retina XDR"],
  ),
  Product(
    image: AppImages.bed1Png,
    name: "King Size Bed",
    price: 500,
    discount: 20,
    description: "Comfortable wooden king size bed with modern design.",
    features: ["Wooden Frame", "6x6 ft", "Modern Design", "Durable"],
  ),
  Product(
    image: AppImages.watch1Png,
    name: "Smart Watch",
    price: 199,
    discount: 15,
    description: "Stylish smartwatch with health tracking features.",
    features: [
      "Heart Rate Monitor",
      "Water Resistant",
      "Bluetooth",
      "Touchscreen",
    ],
  ),
  Product(
    image: AppImages.laptop2Png,
    name: "HP Laptop",
    price: 850,
    discount: 12,
    description: "HP Pavilion laptop with Intel i5 processor.",
    features: ["Intel i5", "8GB RAM", "256GB SSD", "15.6'' Display"],
  ),
  Product(
    image: AppImages.shoes1Png,
    name: "Running Shoes",
    price: 120,
    discount: 25,
    description: "Lightweight running shoes for daily use.",
    features: [
      "Breathable Material",
      "Lightweight",
      "Durable Sole",
      "Comfort Fit",
    ],
  ),
  Product(
    image: AppImages.tv1Png,
    name: "Smart TV",
    price: 600,
    discount: 18,
    description: "55-inch 4K Ultra HD Smart TV with HDR support.",
    features: ["4K Ultra HD", "55-inch", "HDR10", "Smart OS"],
  ),
  Product(
    image: AppImages.sofa1Png,
    name: "Luxury Sofa",
    price: 750,
    discount: 20,
    description: "3-seater luxury sofa with premium comfort.",
    features: ["Leather Finish", "3-Seater", "Modern Style", "Comfortable"],
  ),
  Product(
    image: AppImages.table1Png,
    name: "Dining Table",
    price: 400,
    discount: 10,
    description: "Wooden dining table for family gatherings.",
    features: ["Wooden", "4-Seater", "Durable", "Elegant Design"],
  ),
]);
