import 'package:flutter/material.dart';
import 'package:on_track_app/domains/entities/product.dart';
import 'package:on_track_app/ui/resources/app_images.dart';
import 'package:on_track_app/ui/widgets/draggable_product_details_sheet.dart';

class ProductDetailsMobileLayout extends StatelessWidget {
  const ProductDetailsMobileLayout({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            // Product Image
            FractionallySizedBox(
              heightFactor: 0.6,
              widthFactor: 1,
              child: Image.network(
                product.image ?? AppImages.notImageFoundPlaceholder,
                fit: BoxFit.cover,
              ),
            ),
            // Draggable Scrollable Details Sheet
            DraggableProductDetailsSheet(product: product),
          ],
        ),
      ),
    );
  }
}
