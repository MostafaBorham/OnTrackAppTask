import 'package:flutter/material.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/constants/app_keys.dart';
import 'package:on_track_app/core/routing/app_routes.dart';
import 'package:on_track_app/ui/widgets/product_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: ProductBloc.get(context).searchedProductsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.6),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.productDetailsScreen,
                arguments: {
                  AppKeys.productInfoKey:
                      ProductBloc.get(context).searchedProductsList[index],
                });
          },
          child: ProductItem(
              product: ProductBloc.get(context).searchedProductsList[index]),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
