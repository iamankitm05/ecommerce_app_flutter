import 'package:ecommerce/core/shared/blocs/products/products_bloc.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        bloc: getIt(),
        listener: (context, state) {},
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              getIt<ProductsBloc>().add(GetProducts());
            },
            child: CustomScrollView(
              slivers: [
                if (state is ProductsStateLoading)
                  SliverToBoxAdapter(child: LinearProgressIndicator())
                else if (state is ProductsStateSuccess)
                  SliverList.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return Card(
                        child: ListTile(
                          title: Text(product.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${product.price} ${product.rating}% off | rating: ${product.rating}',
                              ),
                              Gap(2),
                              Text(product.description),
                            ],
                          ),
                          isThreeLine: true,
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
