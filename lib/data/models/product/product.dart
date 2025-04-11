import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    @Default(0) int id,
    @Default('') String name,
    @Default(0) double price,
    @Default(0) double discount,
    @Default(0) double rating,
    @Default('') String category,
    @Default('') String description,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
