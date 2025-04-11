import 'dart:async';

import 'package:ecommerce/data/models/product/product.dart';
import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._productRepository) : super(ProductsStateInitial()) {
    on<GetProducts>(_getProducts);

    add(GetProducts());
  }

  final ProductRepository _productRepository;

  FutureOr<void> _getProducts(
    GetProducts event,
    Emitter<ProductsState> emit,
  ) async {
    if (state is ProductsStateLoading) return;
    emit(ProductsStateLoading());

    final res = await _productRepository.getProducts();

    res.fold(
      (error) => emit(ProductsStateFailure(error)),
      (products) => emit(ProductsStateSuccess(products)),
    );
  }
}
