part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object?> get props => [];
}

final class ProductsStateInitial extends ProductsState {}

final class ProductsStateLoading extends ProductsState {}

final class ProductsStateSuccess extends ProductsState {
  final List<Product> products;

  const ProductsStateSuccess(this.products);
}

final class ProductsStateFailure extends ProductsState {
  final String error;

  const ProductsStateFailure(this.error);
}
