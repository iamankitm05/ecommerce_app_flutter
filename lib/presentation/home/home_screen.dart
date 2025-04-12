import 'package:ecommerce/config/routes/app_routes.dart';
import 'package:ecommerce/core/shared/blocs/products/products_bloc.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:ecommerce/presentation/home/home_appbar.dart';
import 'package:ecommerce/presentation/home/home_bottom_navbar.dart';
import 'package:ecommerce/presentation/home/home_drawer.dart';
import 'package:ecommerce/presentation/home/home_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      bottomNavigationBar: HomeBottomNavbar(),
      drawer: HomeDrawer(),
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
                  SliverFillRemaining(child: HomeLoading())
                else if (state is ProductsStateSuccess)
                  SliverPadding(
                    padding: EdgeInsets.all(8),
                    sliver: SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 280,
                        childAspectRatio: 8 / 14,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.productScreen.name,
                              extra: product,
                            );
                          },
                          child: Card(
                            color: Theme.of(context).colorScheme.surface,
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1.2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),

                                    child: Image.asset(
                                      product.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(product.name),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${product.price} ${product.rating}% off | rating: ${product.rating}',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                        ),
                                      ),
                                      Gap(2),
                                      Text(
                                        product.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  isThreeLine: true,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
