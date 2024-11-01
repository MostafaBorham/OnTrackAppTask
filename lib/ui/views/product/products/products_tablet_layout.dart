import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';


class ProductsTabletLayout extends StatefulWidget {
  const ProductsTabletLayout({super.key});

  @override
  ProductsTabletLayoutState createState() => ProductsTabletLayoutState();
}

class ProductsTabletLayoutState extends State<ProductsTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText('Products Tablet Layout',style: AppStyles.getBoldStyle(),),
    );
  }
}