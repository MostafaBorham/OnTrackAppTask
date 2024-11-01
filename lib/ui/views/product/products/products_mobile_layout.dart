import 'package:flutter/material.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/constants/app_keys.dart';
import 'package:on_track_app/core/routing/app_routes.dart';
import 'package:on_track_app/ui/widgets/multi_products_list_pages.dart';
import 'package:on_track_app/ui/widgets/product_category_filter_widget.dart';
import 'package:on_track_app/ui/widgets/product_search_widget.dart';
import 'package:on_track_app/ui/widgets/user_profile_header.dart';

class ProductsMobileLayout extends StatefulWidget {
  const ProductsMobileLayout({super.key});

  @override
  ProductsMobileLayoutState createState() => ProductsMobileLayoutState();
}

class ProductsMobileLayoutState extends State<ProductsMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              const UserProfileHeader(),
              const SizedBox(
                height: 25,
              ),
              ProductSearchWidget(
                onSearch: (searchInput) {
                  ProductBloc.get(context)
                      .add(SearchInProductsEvent(searchKey: searchInput));
                },
              ),
              const SizedBox(height: 10),
              const ProductCategoryFilterWidget(),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: MultiProductsListPages(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () {
                if (ProductBloc.get(context).newCategoriesList.isNotEmpty) {
                  Navigator.pushNamed(context, AppRoutes.addProductScreen,
                      arguments: {
                        AppKeys.productBlocKey: ProductBloc.get(context),
                      });
                }
              },
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              elevation: 10,
              child: Icon(Icons.add,
                  color: Theme.of(context).colorScheme.onPrimaryFixed),
            ),
          ),
        ],
      ),
    );
  }
}
