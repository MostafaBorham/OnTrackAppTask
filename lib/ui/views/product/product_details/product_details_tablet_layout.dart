import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class ProductDetailsTabletLayout extends StatelessWidget {
  const ProductDetailsTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText(
        'Product Details Tablet Layout',
        style: AppStyles.getBoldStyle(),
      ),
    );
  }
}
