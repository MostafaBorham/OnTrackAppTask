import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:on_track_app/controllers/app_configs/app_configs_bloc.dart';
import 'package:on_track_app/controllers/product/product_bloc.dart';
import 'package:on_track_app/core/utils/di.dart';
import 'package:on_track_app/ui/widgets/adaptive_layout_builder.dart';
import 'package:on_track_app/ui/widgets/custom_app_bar.dart';
import 'package:on_track_app/ui/widgets/no_internet_view.dart';
import 'package:on_track_app/ui/widgets/signout_btn.dart';
import 'products_desktop_layout.dart';
import 'products_mobile_layout.dart';
import 'products_tablet_layout.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  ProductsScreenState createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  final ProductBloc _productBloc= ProductBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigsBloc, AppConfigsState>(
      builder: (context, state) {
        return BlocProvider<ProductBloc>(
          create: (context) => _productBloc..add(GetCategoriesEvent())..add(GetFilteredProductsEvent(category: _productBloc.selectedCategory)),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              leading: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppConfigsBloc.currentConnectionStatue ==
                          InternetConnectionStatus.disconnected
                      ? null
                      : const SignOutBtn()),
            ),
            body: SafeArea(
              child: AppConfigsBloc.currentConnectionStatue ==
                      InternetConnectionStatus.disconnected
                  ? const Center(child: NoInternetView())
                  : RefreshIndicator(
                      color: Theme.of(context).colorScheme.onPrimaryFixed,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      onRefresh: () async {
                        DependencyInjector.instance<ProductBloc>().add(
                            GetFilteredProductsEvent(
                                category:
                                    ProductBloc.get(context).selectedCategory));
                      },
                      child: AdaptiveLayout(
                        mobileLayout: (context) => const ProductsMobileLayout(),
                        tabletLayout: (context) => const ProductsTabletLayout(),
                        desktopLayout: (context) =>
                            const ProductsDesktopLayout(),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
