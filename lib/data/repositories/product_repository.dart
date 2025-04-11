import 'dart:convert';

import 'package:ecommerce/core/utils/app_logger.dart';
import 'package:ecommerce/data/models/product/product.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepository {
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/examples/products_data.json',
      );
      final data = jsonDecode(jsonString) as List<dynamic>? ?? [];
      final products =
          data.map((e) {
            return Product.fromJson(e);
          }).toList();
      return right(products);
    } catch (e) {
      AppLogger.error(e.toString());
      return left('Unexpected error occurred!');
    }
  }
}
