import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class ProductsDesktopLayout extends StatefulWidget {
  const ProductsDesktopLayout({super.key});

  @override
  ProductsDesktopLayoutState createState() => ProductsDesktopLayoutState();
}

class ProductsDesktopLayoutState extends State<ProductsDesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText('Products Desktop Layout',style: AppStyles.getBoldStyle(),),
    );
  }
}