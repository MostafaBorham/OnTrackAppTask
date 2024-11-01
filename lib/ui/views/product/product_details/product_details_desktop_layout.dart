import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';

class ProductDetailsDesktopLayout extends StatelessWidget {
  const ProductDetailsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText('Product Details Desktop Layout',style: AppStyles.getBoldStyle(),),
    );
  }
}
