part of 'products_bloc.dart';

class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class GetProducts extends ProductsEvent {}
