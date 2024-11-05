import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/product/product_bloc.dart';
import '../../domains/entities/product.dart';
import '../../ui/views/auth/signin/signin_screen.dart';
import '../../ui/views/auth/signup/signup_screen.dart';
import '../../ui/views/product/add_product/add_product_screen.dart';
import '../../ui/views/product/product_details/product_details_screen.dart';
import '../../ui/views/product/products/products_screen.dart';
import '../../ui/views/splash_screen.dart';
import '../../ui/views/test_view.dart';
import '../constants/app_keys.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
      ////////////////////////////////////////////////////////////////
      case AppRoutes.productsScreen:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const ProductsScreen());
      ////////////////////////////////////////////////////////////////
      case AppRoutes.addProductScreen:
        final productBloc = ((settings.arguments
            as Map<String, dynamic>)[AppKeys.productBlocKey]) as ProductBloc;
        return CupertinoPageRoute(
            settings: settings,
            builder: (_) => BlocProvider<ProductBloc>.value(
                  value: productBloc,
                  child: const AddProductScreen(),
                ));
      ////////////////////////////////////////////////////////////////
      case AppRoutes.productDetailsScreen:
        final product = ((settings.arguments
            as Map<String, dynamic>)[AppKeys.productInfoKey]) as Product;
        return CupertinoPageRoute(
            settings: settings,
            builder: (_) => ProductDetailsScreen(
                  product: product,
                ));
      ////////////////////////////////////////////////////////////////
      case AppRoutes.signinScreen:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const SignInScreen());
      ////////////////////////////////////////////////////////////////
      case AppRoutes.signupScreen:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const SignUpScreen());
      ////////////////////////////////////////////////////////////////
      case AppRoutes.testScreen:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => TestView());
      ////////////////////////////////////////////////////////////////
      default:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const SizedBox.shrink());
    }
  }
}
