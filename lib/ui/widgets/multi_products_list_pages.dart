import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/circular_loader.dart';
import 'package:on_track_app/ui/widgets/load_more_widget.dart';
import 'package:on_track_app/ui/widgets/products_list.dart';

class MultiProductsListPages extends StatelessWidget {
  const MultiProductsListPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) {
        if (previous is LoadingProductsState &&
            current is! FailGetProductsState &&
            current is! SuccessGetProductsState) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        return ProductBloc.get(context).searchedProductsList.isNotEmpty
            ? ListView(
                children: [
                  ProductsList(
                    key: UniqueKey(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  if (ProductBloc.get(context).isMoreProducts)
                    BlocBuilder<ProductBloc, ProductState>(
                      buildWhen: (previous, current) {
                        if (previous is LoadingMoreProductsState &&
                            current is! FailLoadMoreProductsState &&
                            current is! SuccessLoadMoreProductsState) {
                          return false;
                        }
                        return true;
                      },
                      builder: (context, state) {
                        return state is LoadingMoreProductsState
                            ? CircularLoader(
                                size: 15.s(),
                                color: Theme.of(context).colorScheme.surface,
                              )
                            : GestureDetector(
                                onTap: () {
                                  ProductBloc.get(context).add(
                                      LoadMoreProductsEvent(
                                          category: ProductBloc.get(context)
                                              .selectedCategory));
                                },
                                child: const LoadMoreWidget(),
                              );
                      },
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            : state is LoadingProductsState
                ? Center(
                    child: CircularLoader(
                    size: 25.s(),
                    color: Theme.of(context).colorScheme.surface,
                  ))
                : Center(
                    child: AutoSizeText(
                    AppStrings.noProductsFound,
                    style: AppStyles.getBoldStyle(
                        color: Theme.of(context).colorScheme.onPrimaryFixed,
                        fontSize: 20.s()),
                  ));
      },
    );
  }
}
